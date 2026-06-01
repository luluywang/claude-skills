#!/usr/bin/env python3
"""More precise scan: find user *corrections/requests* in copyedit sessions
that specifically concern section openers, motivation, or subsection relevance.
"""
import json, re, sys
from pathlib import Path
from collections import defaultdict, Counter

LOGS = Path("/Users/luluywang/Library/CloudStorage/Dropbox/claude-logs")

# Word-boundary regexes. All case-insensitive.
PATTERNS = {
    "section opener": r"\bsection opener",
    "opener": r"\bopener\b",
    "opening paragraph": r"\bopening paragraph",
    "first paragraph of (the )?section": r"first paragraph of (the )?section",
    "why this section": r"why (does )?this section",
    "why this matters": r"why (this|it) matters",
    "doesn't motivate": r"(doesn'?t|does not|fails to) motivate",
    "motivate the section": r"motivate (the|this) (section|chapter|subsection)",
    "RAP (research-answer-positioning)": r"\bRAP\b(?!\.|id|idfuzz)",
    "tie back / tie to": r"\btie[s]? (back )?to\b",
    "signpost": r"\bsignpost",
    "roadmap": r"\broad[- ]?map\b",
    "relevance to paper": r"relevan(t|ce) (to|for) (the )?(paper|story|argument|question)",
    "doesn't belong / fit": r"(doesn'?t|does not) (belong|fit)",
    "what does this section do": r"what does (this|the) (section|subsection)",
    "purpose of this section": r"purpose of (this|the) (section|subsection)",
    "why is this here": r"why is (this|that) here",
    "stakes": r"\bstakes\b",
    "no motivation": r"no (clear )?motivation",
    "unmotivated": r"unmotivated",
}
PATS = {k: re.compile(v, re.IGNORECASE) for k, v in PATTERNS.items()}

COPYEDIT_CTX = re.compile(r"/copyedit|copyedit(_|\s)(review|flow|structure)|flow_extraction|writing_quality|structure_analysis", re.IGNORECASE)


def iter_messages(path):
    try:
        with open(path, "r", errors="ignore") as f:
            for line in f:
                line = line.strip()
                if not line:
                    continue
                try:
                    obj = json.loads(line)
                except json.JSONDecodeError:
                    continue
                yield obj
    except OSError:
        return


def extract_text(obj):
    msg = obj.get("message") or obj.get("content") or obj
    if isinstance(msg, str):
        return msg
    if not isinstance(msg, dict):
        return ""
    content = msg.get("content")
    if isinstance(content, str):
        return content
    if isinstance(content, list):
        parts = []
        for c in content:
            if isinstance(c, dict):
                t = c.get("text") or c.get("content") or ""
                if isinstance(t, str):
                    parts.append(t)
        return "\n".join(parts)
    return ""


def get_role(obj):
    msg = obj.get("message", {})
    if isinstance(msg, dict):
        return msg.get("role") or obj.get("type", "")
    return obj.get("type", "")


def scan():
    # (session, role, snippet, kw, near_copyedit)
    hits = []
    kw_counter = Counter()
    session_examples = defaultdict(list)

    for jsonl in LOGS.rglob("*.jsonl"):
        msgs = list(iter_messages(jsonl))
        if not msgs:
            continue

        texts = []
        for m in msgs[:4000]:
            role = get_role(m)
            t = extract_text(m)
            if t:
                texts.append((role, t))

        # Full blob lowercased — skip sessions that never mention copyedit
        full_blob = "\n".join(t for _, t in texts)
        if not COPYEDIT_CTX.search(full_blob):
            continue

        for role, t in texts:
            # Only look at user-role messages (direct feedback)
            if not (role or "").startswith("user"):
                continue
            if len(t) > 6000:
                # trim very long user messages (tool outputs / pastes)
                t_scan = t[:6000]
            else:
                t_scan = t
            for kw, pat in PATS.items():
                m = pat.search(t_scan)
                if m:
                    idx = m.start()
                    start = max(0, idx - 180)
                    end = min(len(t_scan), idx + 220)
                    snippet = t_scan[start:end].replace("\n", " ")
                    # Skip if the snippet is clearly tool output noise
                    if snippet.count("|") > 6 or snippet.count("→") > 3:
                        continue
                    if "bootstrap" in snippet.lower() and kw.startswith("RAP"):
                        continue
                    hits.append((jsonl.name, role, snippet, kw))
                    kw_counter[kw] += 1
                    session_examples[jsonl.name].append((kw, snippet))
                    break
    return hits, kw_counter, session_examples


def main():
    hits, kw_counter, session_examples = scan()
    print(f"# Refined relevance scan\n")
    print(f"- Total hits: {len(hits)}")
    print(f"- Sessions: {len(session_examples)}\n")

    print("## Keyword distribution\n")
    for kw, n in kw_counter.most_common():
        print(f"- {kw}: {n}")
    print()

    print("## Best user-feedback snippets\n")
    shown = 0
    for f, items in sorted(session_examples.items()):
        # prefer sessions with multiple hits
        if len(items) == 0:
            continue
        print(f"### {f[:60]}")
        for kw, snippet in items[:4]:
            print(f"- **[{kw}]** {snippet}")
        print()
        shown += 1
        if shown >= 80:
            break


if __name__ == "__main__":
    main()
