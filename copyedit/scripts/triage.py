#!/usr/bin/env python3
"""Risk x severity triage for copyedit review items.

Subcommands (run from the paper directory, the one that holds notes/):

  extract   Parse notes/review_digest.md into notes/triage.json. Marks each item
            open / stale / applied / decided, and computes hard risk signals.
  merge     Fold the model's risk judgments (notes/triage_judgments.json) into
            triage.json and assign queues: decide / auto / drop.
  render    Write the A/B decision list (notes/review_decide.md).
  apply     Apply items to the .tex sources: --queue auto, or --ids D3 D7 ...
            Backs up every touched file, re-checks each edit, optional --compile.
  record    Append author decisions (D3A, D3B, or D3C = own wording) to
            notes/copyedit_decisions.jsonl.

Risk = could applying the edit change what the paper claims, or undo a choice
the author already made. Severity = how much the issue hurts the paper.
Hard signals force risk=high. BLOCK signals (protected tokens, abstract, a prior
author decision, no rewrite) can never be overridden. REVIEW signals (hedge, scope,
length, load-bearing term) can be overridden by the model with a written reason.
"""
import argparse, datetime, hashlib, json, os, re, shutil, subprocess, sys

DIGEST = "notes/review_digest.md"
TRIAGE = "notes/triage.json"
JUDG = "notes/triage_judgments.json"
LEDGER = "notes/copyedit_decisions.jsonl"
DECIDE_MD = "notes/review_decide.md"
LOADBEARING = "notes/copyedit_load_bearing_terms.md"

HIGH_SEV = {"Critical", "High"}
# Words whose addition or removal changes the strength or scope of a claim.
HEDGE = r"may|might|could|can|cannot|must|likely|unlikely|possibly|perhaps|appears?|seems?|suggests?|roughly|approximately|nearly|almost"
NEGATE = r"not|no|never|none|neither|nor|without|only|just|all|every|always"
PROTECT = re.compile(
    r"\\(?:ref|eqref|cref|Cref|label|cite|citet|citep|parencite|textcite|footcite|"
    r"scalarinput|absinput|scalarpctinput|input|include|subfile)\*?(?:\[[^\]]*\])*\{[^}]*\}"
    r"|\$[^$]*\$|\d+(?:[.,]\d+)?")


def norm(s):
    return re.sub(r"\s+", " ", s).strip()


def words(s, pat):
    return sorted(w.lower() for w in re.findall(rf"\b(?:{pat})\b", s, re.I))


def sentences(s):
    return [x for x in re.split(r"(?<=[.?!])\s+(?=[A-Z\\])", norm(s)) if x]


def nwords(s):
    return len(re.sub(r"\\[a-zA-Z]+\*?(\[[^\]]*\])?\{[^}]*\}", "X", s).split())


def load_terms():
    if not os.path.exists(LOADBEARING):
        return []
    return [m.group(1).strip().strip('"') for m in
            re.finditer(r"^- ([^(\n]+?)(?:\s*\(.*\))?$", open(LOADBEARING).read(), re.M)]


def load_ledger():
    return [json.loads(l) for l in open(LEDGER)] if os.path.exists(LEDGER) else []


def gate(text):
    """Surface rules a new sentence must pass (R-40WORD, R-EMDASH, R-COLON, stray semicolons)."""
    fails = []
    for s in sentences(text):
        if nwords(s) > 40:
            fails.append(f"R-40WORD ({nwords(s)} words)")
    body = re.sub(r"\$[^$]*\$|\\[a-zA-Z]+\{[^}]*\}", "", text)
    if "---" in body or re.search(r"\s--\s", body):
        fails.append("R-EMDASH")
    if re.search(r"[a-z]: [a-z]", body):
        fails.append("R-COLON")
    return fails


def hard_signals(item, terms, ledger):
    o, p = item["orig"], item.get("prop") or ""
    for d in ledger:
        if d["file"] == item["file"] and (norm(d["orig"]) in norm(o) or norm(o) in norm(d["orig"])):
            return [f"BLOCK: author already decided ({d['choice']}) on {d['date']}"]
    if not p:
        return ["BLOCK: no rewrite proposed"]
    sig = []
    if sorted(PROTECT.findall(o)) != sorted(PROTECT.findall(p)):
        sig.append("BLOCK: numbers, math, refs or citations differ")
    if words(o, HEDGE) != words(p, HEDGE):
        sig.append("REVIEW: hedge words differ")
    if words(o, NEGATE) != words(p, NEGATE):
        sig.append("REVIEW: negation or scope words differ")
    for t in terms:
        if t.lower() in o.lower() and t.lower() not in p.lower():
            sig.append(f"REVIEW: load-bearing term dropped: {t}")
    r = len(p) / max(len(o), 1)
    if r < 0.6 or r > 1.6:
        sig.append(f"REVIEW: length ratio {r:.2f}")
    if item.get("in_abstract"):
        sig.append("BLOCK: abstract")
    return sig


def parse_digest(path):
    txt = open(path).read()
    items, cur_file, cur_sev = [], None, None
    for blk in re.split(r"\n(?=### |#### - \[)", txt):
        h = blk.splitlines()[0] if blk else ""
        m = re.match(r"### (Critical|High|Medium|Low) — \[?([^\]\s]+\.tex)\]?", h)
        if m:
            cur_sev, cur_file = m.group(1), m.group(2)
            continue
        if not h.startswith("#### - [") or not cur_file:
            continue
        o = re.search(r"\*\*Original:\*\*\s*```[a-z]*\n(.*?)\n```", blk, re.S)
        if not o:
            continue
        p = re.search(r"\*\*Proposed Revision:\*\*\s*```[a-z]*\n(.*?)\n```", blk, re.S)
        src = re.search(r"\*\*Source:\*\*\s*(\S+)", blk)
        sev = re.search(r"`(Critical|High|Medium|Low)`", h)
        title = re.sub(r"\s*`[^`]*`", "", h[len("#### - [ ] "):]).strip()
        items.append(dict(file=cur_file, severity=sev.group(1) if sev else cur_sev, title=title,
                          source=src.group(1) if src else "", orig=o.group(1),
                          prop=p.group(1) if p else None))
    return items


def find(src, orig):
    pat = r"\s+".join(re.escape(t) for t in orig.split())
    return list(re.finditer(pat, src))


def cmd_extract(a):
    terms = load_terms()
    ledger = load_ledger()
    items, seen, out = parse_digest(a.digest), set(), []
    for it in items:
        key = (it["file"], norm(it["orig"])[:80])
        if key in seen:
            continue  # same sentence flagged by two tasks: keep the first (digest order = priority)
        seen.add(key)
        it["id"] = hashlib.sha1(f"{it['file']}|{norm(it['orig'])}".encode()).hexdigest()[:8]
        if not os.path.exists(it["file"]):
            it["status"] = "stale"; out.append(it); continue
        src = open(it["file"]).read()
        hits = find(src, it["orig"])
        if it["prop"] and find(src, it["prop"]):
            it["status"] = "applied"
        elif len(hits) != 1:
            it["status"] = "stale"
        else:
            it["status"] = "open"
            before = src[:hits[0].start()]
            it["in_abstract"] = before.count(r"\begin{abstract}") > before.count(r"\end{abstract}")
            it["line"] = before.count("\n") + 1
        it["sev_band"] = "high" if it["severity"] in HIGH_SEV else "low"
        it["hard_signals"] = hard_signals(it, terms, ledger) if it["status"] == "open" else []
        it["gate_fails"] = gate(it["prop"]) if it["prop"] else []
        out.append(it)
    json.dump(out, open(a.out, "w"), indent=1)
    op = [i for i in out if i["status"] == "open"]
    print(f"items {len(out)}: open {len(op)}, applied {sum(i['status']=='applied' for i in out)}, "
          f"stale {sum(i['status']=='stale' for i in out)}")
    print(f"open with hard signals {sum(bool(i['hard_signals']) for i in op)}, "
          f"needing model judgment {sum(not any(x.startswith('BLOCK') for x in i['hard_signals']) for i in op)}")
    if a.list:
        for i in op:
            if not any(x.startswith("BLOCK") for x in i["hard_signals"]):
                flags = f" signals: {'; '.join(i['hard_signals'])}" if i["hard_signals"] else ""
                print(f"\n[{i['id']}] {i['file']}:{i.get('line')} {i['severity']}{flags}\nA: {i['orig']}\nB: {i['prop']}")


def cmd_merge(a):
    items = json.load(open(TRIAGE))
    judg = json.load(open(JUDG)) if os.path.exists(JUDG) else {}
    unjudged = [i["id"] for i in items if i["status"] == "open" and i["id"] not in judg
                and not any(x.startswith("BLOCK") for x in i["hard_signals"])]
    if unjudged:
        sys.exit(f"merge refused: {len(unjudged)} open items have no risk judgment, so they would be "
                 f"dropped unseen. Judge them first: {' '.join(unjudged)}")
    for i in items:
        if i["status"] != "open":
            i["queue"] = None; continue
        j = judg.get(i["id"], {})
        if j.get("adapted"):
            i["prop_original"], i["prop"] = i["prop"], j["adapted"]
            i["gate_fails"] = gate(i["prop"])
            i["hard_signals"] = hard_signals(i, load_terms(), load_ledger())
        blocking = [x for x in i["hard_signals"] if x.startswith("BLOCK")]
        review = [x for x in i["hard_signals"] if x.startswith("REVIEW")]
        overridden = bool(review) and j.get("override") and not blocking
        forced = blocking or (review and not overridden) or i["gate_fails"]
        risk = "high" if (forced or j.get("risk", "high") == "high") else "low"
        i["risk"], i["risk_reason"] = risk, "; ".join(i["hard_signals"] + i["gate_fails"]) or j.get("reason", "")
        i["question"], i["rank"] = j.get("question"), j.get("rank", 999)
        if any(x.startswith("BLOCK: author already decided") for x in i["hard_signals"]):
            i["queue"] = "decided"
        elif risk == "low" and j.get("gain") is False:
            i["queue"], i["risk_reason"] = "drop", "low risk, no improvement: " + j.get("reason", "")
        elif risk == "low":
            i["queue"] = "auto"
        elif i["sev_band"] == "high":
            i["queue"] = "decide"
        else:
            i["queue"] = "drop"
    dec = sorted([i for i in items if i.get("queue") == "decide"], key=lambda i: (i["rank"], i["file"], i.get("line", 0)))
    for n, i in enumerate(dec, 1):
        i["did"] = f"D{n}"
    json.dump(items, open(TRIAGE, "w"), indent=1)
    q = lambda k: sum(i.get("queue") == k for i in items)
    print(f"decide {q('decide')} (high severity, high risk), auto {q('auto')} (low risk), drop {q('drop')} (low severity and high risk, or no improvement), "
          f"already decided {q('decided')}")


def cmd_render(a):
    items = json.load(open(TRIAGE))
    dec = sorted([i for i in items if i.get("queue") == "decide"], key=lambda i: int(i["did"][1:]))
    auto = [i for i in items if i.get("queue") == "auto"]
    drop = [i for i in items if i.get("queue") == "drop"]
    L = ["# Decisions needed", "",
         f"{len(dec)} items need your call (high severity, high risk). A is the current text. B is the change.",
         f"{len(auto)} low-risk items will be applied by `/copyedit auto`. {len(drop)} low-severity, high-risk items are dropped (listed in `notes/triage.json`).",
         "", "Reply with one letter per item, for example `D1B D2A`. Items you do not letter stay as they are.", ""]
    for i in dec:
        L.append(f"### {i['did']}. `{i['file']}:{i.get('line', '?')}` {i['title']} ({i['severity']})")
        L.append(f"- **A:** {i['orig']}")
        L.append(f"- **B:** {i['prop'] if i['prop'] else '(no rewrite; your input needed)'}")
        if i.get("risk_reason"):
            L.append(f"- **Why it needs you:** {i['risk_reason']}")
        if i.get("question"):
            L.append(f"- **Question:** {i['question']}")
        L.append("")
    open(DECIDE_MD, "w").write("\n".join(L))
    print(f"wrote {DECIDE_MD}: {len(dec)} decisions")


def protected_ok(old, new):
    return sorted(PROTECT.findall(old)) == sorted(PROTECT.findall(new))


def cmd_apply(a):
    items = json.load(open(TRIAGE))
    if a.queue:
        todo = [i for i in items if i.get("queue") == a.queue]
    else:
        want = set(a.ids)
        todo = [i for i in items if i.get("did") in want or i["id"] in want]
    stamp = datetime.datetime.now().strftime("%Y%m%d_%H%M%S")
    bdir = f"notes/history/pre_apply_{stamp}"
    files, done, fails = {}, [], []
    for i in todo:
        if not i.get("prop"):
            fails.append((i, "no rewrite")); continue
        f = i["file"]
        s = files.get(f) or open(f).read()
        hits = find(s, i["orig"])
        if len(hits) != 1:
            fails.append((i, f"{len(hits)} matches")); continue
        if a.queue == "auto" and (not protected_ok(i["orig"], i["prop"]) or gate(i["prop"])):
            fails.append((i, "failed re-check")); continue
        files[f] = s[:hits[0].start()] + i["prop"] + s[hits[0].end():]
        done.append(i)
    if a.dry_run:
        for i in done:
            print(f"would apply {i.get('did') or i['id']} {i['file']}:{i.get('line')}")
    else:
        os.makedirs(bdir, exist_ok=True)
        for f, s in files.items():
            old = open(f).read()
            # comment lines (% HARDCODED, % CONSTANT) must survive byte for byte
            com = lambda t: [l for l in t.splitlines() if l.lstrip().startswith("%")]
            if com(old) != com(s):
                print(f"ABORT {f}: comment lines changed"); continue
            shutil.copy2(f, os.path.join(bdir, os.path.basename(f)))
            open(f, "w").write(s)
        for i in done:
            i["status"] = "applied"
        json.dump(items, open(TRIAGE, "w"), indent=1)
    print(f"applied {len(done)}, failed {len(fails)}" + ("" if a.dry_run else f", backups in {bdir}"))
    for i, why in fails:
        print(f"  not applied {i.get('did') or i['id']} {i['file']}:{i.get('line')}: {why}")
    if a.compile and not a.dry_run:
        r = subprocess.run(a.compile, shell=True, capture_output=True, text=True)
        print(f"compile exit {r.returncode}")
        sys.exit(r.returncode)


def cmd_record(a):
    items = {i.get("did"): i for i in json.load(open(TRIAGE)) if i.get("did")}
    today = datetime.date.today().isoformat()
    with open(LEDGER, "a") as fh:
        for tok in a.choices:
            m = re.fullmatch(r"(D\d+)([ABC])", tok)
            if not m or m.group(1) not in items:
                print(f"skip {tok}"); continue
            i = items[m.group(1)]
            fh.write(json.dumps(dict(date=today, file=i["file"], orig=i["orig"], prop=i["prop"],
                                     choice=m.group(2), title=i["title"])) + "\n")
    print(f"recorded {len(a.choices)} decisions in {LEDGER}")


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    sp = ap.add_subparsers(dest="cmd", required=True)
    e = sp.add_parser("extract"); e.add_argument("--digest", default=DIGEST); e.add_argument("--out", default=TRIAGE)
    e.add_argument("--list", action="store_true", help="print items that need a model risk judgment")
    sp.add_parser("merge"); sp.add_parser("render")
    p = sp.add_parser("apply"); g = p.add_mutually_exclusive_group(required=True)
    g.add_argument("--queue", choices=["auto"]); g.add_argument("--ids", nargs="+")
    p.add_argument("--dry-run", action="store_true"); p.add_argument("--compile")
    r = sp.add_parser("record"); r.add_argument("choices", nargs="+")
    a = ap.parse_args()
    {"extract": cmd_extract, "merge": cmd_merge, "render": cmd_render, "apply": cmd_apply, "record": cmd_record}[a.cmd](a)


if __name__ == "__main__":
    main()
