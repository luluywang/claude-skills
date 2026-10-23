#!/usr/bin/env python3
"""
logsync.py — back up Claude Code transcripts into one store layout, pull other
hosts' stores into it, and archive idle transcripts losslessly.

Store layout (identical on every machine):
  <project>/<host>_<session>.jsonl         live transcript
  <project>/<host>_<session>.jsonl.zst     same, once idle (lossless, verified)
  <project>/<host>_<session>.condensed.md  readable digest, written with the .zst
  <project>/<host>_<session>/...           subagents, tool results
  _machine/<host>/...                      everything else backed up from ~/.claude

Each host owns the entries carrying its name: only the owner collects and
compresses them; other stores just mirror them via `pull`.

Commands:
  collect   copy changed files from ~/.claude into this host's entries
  pull      rsync PULL_FROM's store into this one (no-op if unset)
  archive   compress this host's idle transcripts; resolve .jsonl/.zst pairs
  run       collect, pull, archive
  hook      Claude Code hook entry point (reads the hook JSON on stdin):
            Stop/SessionEnd collect the current session; SessionStart starts
            `run` in the background at most every RUN_INTERVAL_HOURS
  migrate   one-off: fold legacy layouts (raw/, hpc/, timestamped names) in

Config (~/.claude/hooks/log_sync.conf, KEY=VALUE; environment overrides):
  CLAUDE_LOG_DIR      store (default: Dropbox claude-logs, else ~/claude-logs)
  LOG_HOST            name for this host's entries (default: short hostname;
                      set it where several nodes share one home directory)
  PULL_FROM           rsync source of another store, e.g. user@host:claude-logs
  RUN_INTERVAL_HOURS  SessionStart throttle (default 6)
"""

import argparse
import datetime
import fcntl
import hashlib
import json
import os
import re
import socket
import subprocess
import sys
import tempfile
import time
from pathlib import Path

SCRIPT_DIR = Path(__file__).resolve().parent
sys.path.insert(0, str(SCRIPT_DIR))
from condense_log import condense  # noqa: E402

CLAUDE_ROOT = Path.home() / ".claude"
STATE_DIR = CLAUDE_ROOT / "log_sync_state"
CONF_PATHS = [CLAUDE_ROOT / "hooks/log_sync.conf", CLAUDE_ROOT / "hooks/export-session.conf"]
ZSTD = ["zstd", "-19", "--long=27", "-T0", "-q"]
CHUNK = 1 << 20
SID = r"[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}"
SID_RE = re.compile(rf"^{SID}$")
# Trees under ~/.claude that are backed up; installed code and settings are not.
SCOPE = ("projects", "delegate-runs", "logs", "debug")
SKIP_TOP = {"plugins", "skills", "log_sync_state"} | set(SCOPE)
# Store entries no step touches.
STORE_SKIP = {"self-improve-cache"}


def log(msg):
    print(f"{datetime.datetime.now():%F %T} {msg}", flush=True)


# ── Config ───────────────────────────────────────────────────────────────────

def load_config():
    conf = {}
    for path in CONF_PATHS:
        if path.is_file():
            for line in path.read_text().splitlines():
                line = line.strip()
                if line.startswith("export "):
                    line = line[7:]
                if not line or line.startswith("#") or "=" not in line:
                    continue
                key, val = line.split("=", 1)
                conf[key.strip()] = os.path.expanduser(val.strip().strip("'\""))
            break
    for key in ("CLAUDE_LOG_DIR", "LOG_HOST", "PULL_FROM", "RUN_INTERVAL_HOURS"):
        if os.environ.get(key):
            conf[key] = os.environ[key]
    if not conf.get("CLAUDE_LOG_DIR"):
        for cand in (Path.home() / "Library/CloudStorage/Dropbox", Path.home() / "Dropbox"):
            if cand.is_dir():
                conf["CLAUDE_LOG_DIR"] = str(cand / "claude-logs")
                break
        else:
            conf["CLAUDE_LOG_DIR"] = str(Path.home() / "claude-logs")
    conf.setdefault("LOG_HOST", socket.gethostname().split(".")[0])
    return conf


# ── Content helpers ──────────────────────────────────────────────────────────

class Reader:
    """Byte stream of a file, decompressing .zst transparently."""

    def __init__(self, path, check=False):
        self.path = Path(path)
        self.check = check  # caller reads to EOF and needs decompression to have succeeded
        self.proc = None

    def __enter__(self):
        if self.path.suffix == ".zst":
            self.proc = subprocess.Popen(["zstd", "-dc", "--long=31", str(self.path)],
                                         stdout=subprocess.PIPE, stderr=subprocess.DEVNULL)
            return self.proc.stdout
        self.f = open(self.path, "rb")
        return self.f

    def __exit__(self, exc_type, *exc):
        if not self.proc:
            self.f.close()
            return
        self.proc.stdout.close()
        if self.check and exc_type is None:
            if self.proc.wait() != 0:
                raise RuntimeError(f"zstd failed to decompress {self.path}")
        else:
            # compare() may stop early; the decompressor is not needed any more.
            self.proc.kill()
            self.proc.wait()


def content_hash(path):
    h = hashlib.sha256()
    with Reader(path, check=True) as f:
        for block in iter(lambda: f.read(CHUNK), b""):
            h.update(block)
    return h.hexdigest()


def compare(a, b):
    """Compare decompressed contents: 'same', 'a_longer', 'b_longer' (the other
    is a strict prefix — transcripts only grow), or 'diverged'."""
    with Reader(a) as fa, Reader(b) as fb:
        while True:
            ca, cb = fa.read(CHUNK), fb.read(CHUNK)
            if ca == cb:
                if not ca:
                    return "same"
                continue
            n = min(len(ca), len(cb))
            if ca[:n] != cb[:n]:
                return "diverged"
            # read() only returns short at EOF, so the shorter side has ended.
            return "a_longer" if len(ca) > len(cb) else "b_longer"


def is_transcript(rel):
    """<project>/<host>_<session>.jsonl[.zst] — the files that get digests."""
    parts = rel.parts
    return (len(parts) == 2 and parts[0] != "_machine"
            and re.search(rf"_{SID}\.jsonl(\.zst)?$", parts[1]) is not None)


def owner(rel):
    """Host owning a store entry, from its <host>_ prefix or _machine/<host>/."""
    parts = rel.parts
    if parts[0] == "_machine":
        return parts[1] if len(parts) > 1 else None
    if len(parts) >= 2 and "_" in parts[1]:
        return parts[1].split("_", 1)[0]
    return None


def condensed_path(zst):
    return zst.with_name(zst.name[: -len(".jsonl.zst")] + ".condensed.md")


def write_condensed(transcript, md):
    tmp = md.with_name("." + md.name + ".tmp")
    with open(tmp, "w", encoding="utf-8") as out:
        condense(transcript, out)
    os.replace(tmp, md)


def compress(src, dst):
    """src .jsonl -> dst .jsonl.zst (replacing any existing dst), verified
    before publishing; dst carries src's mtime so `collect` can match it."""
    tmp = dst.with_name("." + dst.name)  # hidden from every step; keeps the .zst suffix
    try:
        subprocess.run(ZSTD + ["-f", "-o", str(tmp), str(src)], check=True)
        if content_hash(tmp) != content_hash(src):
            raise RuntimeError(f"round-trip hash mismatch for {src}")
        st = src.stat()
        os.utime(tmp, ns=(st.st_atime_ns, st.st_mtime_ns))
        os.replace(tmp, dst)
    finally:
        tmp.unlink(missing_ok=True)


def store_files(store, pattern="*"):
    for p in store.rglob(pattern):
        rel = p.relative_to(store)
        if rel.parts[0] in STORE_SKIP or any(x.startswith(".") for x in rel.parts):
            continue
        if p.is_file() and not p.is_symlink():
            yield p, rel


def remap_manifest(store, renames):
    """Keep self-improve's scan cache keyed by current store paths."""
    path = store / "self-improve-cache/manifest.json"
    if not renames or not path.exists():
        return
    manifest = json.loads(path.read_text())
    processed = manifest.get("processed", {})
    changed = 0
    for old, new in renames.items():
        if old in processed and old != new:
            entry = processed.pop(old)
            processed.setdefault(new, entry)
            changed += 1
    if changed:
        tmp = path.with_name(".manifest.json.tmp")
        tmp.write_text(json.dumps(manifest, indent=2) + "\n")
        os.replace(tmp, path)
        log(f"  remapped {changed} self-improve manifest keys")


# ── collect ──────────────────────────────────────────────────────────────────

def sanitize(name):
    return re.sub(r"[^a-z0-9_-]", "-", name.lower()) or "unknown"


def first_cwd(transcript):
    """cwd the session started in (.jsonl or .jsonl.zst)."""
    try:
        with Reader(transcript) as f:
            for i, line in enumerate(f):
                if i > 200:
                    break
                try:
                    cwd = json.loads(line).get("cwd")
                except (ValueError, AttributeError):
                    continue
                if cwd:
                    return cwd
    except OSError:
        pass
    return None


class Collector:
    def __init__(self, root, store, host, dry=False):
        self.root, self.store, self.host, self.dry = root, store, host, dry
        self.projects = {}
        self.copied = self.seen = 0

    def project(self, enc_dir):
        """Project name for a ~/.claude/projects/<encoded-cwd> dir: basename of
        the cwd its sessions started in."""
        if enc_dir not in self.projects:
            cwd = None
            for t in sorted(enc_dir.glob("*.jsonl")):
                cwd = first_cwd(t)
                if cwd:
                    break
            self.projects[enc_dir] = sanitize(Path(cwd).name if cwd else enc_dir.name.lstrip("-"))
        return self.projects[enc_dir]

    def dest(self, src):
        try:
            rel = src.relative_to(self.root)
        except ValueError:
            return self.store / "_machine" / self.host / "external" / src.parent.name / src.name
        parts = rel.parts
        if parts[0] == "projects" and len(parts) >= 3:
            proj = self.project(self.root / "projects" / parts[1])
            name = parts[2]
            if len(parts) == 3 and name.endswith(".jsonl") and SID_RE.match(name[:-6]):
                return self.store / proj / f"{self.host}_{name}"
            if len(parts) > 3 and SID_RE.match(name):
                return self.store / proj / f"{self.host}_{name}" / Path(*parts[3:])
        return self.store / "_machine" / self.host / rel

    def scope(self):
        files = set()
        for name in SCOPE:
            folder = self.root / name
            if folder.is_dir():
                files.update(p for p in folder.rglob("*") if p.is_file() and not p.is_symlink())
        for top, dirs, names in os.walk(self.root):
            if Path(top) == self.root:
                dirs[:] = [d for d in dirs if d not in SKIP_TOP]
            files.update(Path(top) / n for n in names if n.endswith(".jsonl")
                         and not os.path.islink(os.path.join(top, n)))
        return sorted(files)

    def session_files(self, transcript):
        files = [transcript]
        side = transcript.parent / transcript.stem
        if side.is_dir():
            files += sorted(p for p in side.rglob("*") if p.is_file() and not p.is_symlink())
        return files

    def collect(self, files):
        for src in files:
            self.seen += 1
            if self.copy(src, self.dest(src)):
                self.copied += 1

    def copy(self, src, dst):
        st = src.stat()
        if unchanged(st, dst):
            return False
        if self.dry:
            print(f"would copy: {src} -> {dst.relative_to(self.store)}")
            return True
        dst.parent.mkdir(parents=True, exist_ok=True)
        STATE_DIR.mkdir(parents=True, exist_ok=True)
        lock_name = hashlib.sha1(str(dst).encode()).hexdigest()[:16] + ".lock"
        # Lock per destination so simultaneous Stop/SessionEnd cannot publish stale copies.
        with open(STATE_DIR / lock_name, "a") as lock:
            fcntl.flock(lock, fcntl.LOCK_EX)
            for _ in range(3):
                st = src.stat()
                fd, name = tempfile.mkstemp(prefix="." + dst.name, dir=dst.parent)
                tmp = Path(name)
                try:
                    h = hashlib.sha256()
                    with open(src, "rb") as inp, os.fdopen(fd, "wb") as out:
                        for block in iter(lambda: inp.read(CHUNK), b""):
                            h.update(block)
                            out.write(block)
                        out.flush()
                        os.fsync(out.fileno())
                    if content_hash(tmp) != h.hexdigest():
                        raise OSError(f"copy verification failed: {src}")
                    # Source changed mid-copy (live transcript): retry.
                    if (st.st_size, st.st_mtime_ns) != (src.stat().st_size, src.stat().st_mtime_ns):
                        continue
                    os.utime(tmp, ns=(st.st_atime_ns, st.st_mtime_ns))
                    os.replace(tmp, dst)
                    return True
                finally:
                    tmp.unlink(missing_ok=True)
            raise OSError(f"source kept changing; retry: {src}")


def unchanged(src_st, dst):
    """Copies carry the source mtime and transcripts only grow, so a matching
    mtime (and size, for uncompressed copies) means nothing new to copy."""
    try:
        d = dst.stat()
        if (d.st_size, d.st_mtime_ns) == (src_st.st_size, src_st.st_mtime_ns):
            return True
    except FileNotFoundError:
        pass
    if dst.suffix == ".jsonl":
        try:
            return dst.with_name(dst.name + ".zst").stat().st_mtime_ns == src_st.st_mtime_ns
        except FileNotFoundError:
            pass
    return False


def cmd_collect(conf, dry=False):
    store = Path(conf["CLAUDE_LOG_DIR"])
    c = Collector(CLAUDE_ROOT.resolve(), store, conf["LOG_HOST"], dry)
    c.collect(c.scope())
    log(f"collect: {c.copied} of {c.seen} files changed -> {store}")
    return 0


# ── pull ─────────────────────────────────────────────────────────────────────

def cmd_pull(conf, dry=False):
    src = conf.get("PULL_FROM")
    if not src:
        return 0
    store = Path(conf["CLAUDE_LOG_DIR"])
    cmd = ["rsync", "-az", "--partial", "--itemize-changes",
           "--exclude=.*", "--exclude=*.tmp", "--exclude=/self-improve-cache/",
           "-e", "ssh -o BatchMode=yes -o ConnectTimeout=20",
           src.rstrip("/") + "/", str(store) + "/"]
    if dry:
        cmd.insert(1, "--dry-run")
    proc = subprocess.run(cmd, capture_output=True, text=True)
    if proc.returncode != 0:
        log(f"pull: FAILED from {src}: {proc.stderr.strip()[-500:]}")
        return 1
    n = sum(line.startswith(">f") for line in proc.stdout.splitlines())
    log(f"pull: {n} files from {src}")
    return 0


# ── archive ──────────────────────────────────────────────────────────────────

def cmd_archive(conf, dry=False, min_age_days=3.0, all_hosts=False):
    store = Path(conf["CLAUDE_LOG_DIR"])
    host = conf["LOG_HOST"]
    cutoff = time.time() - min_age_days * 86400
    n = dict(archived=0, updated=0, deduped=0, recent=0, conflicts=0, errors=0)
    renames = {}
    for src, rel in sorted(store_files(store, "*.jsonl")):
        if src.stat().st_mtime > cutoff:
            n["recent"] += 1
            continue
        dst = src.with_name(src.name + ".zst")
        owned = all_hosts or owner(rel) == host
        try:
            state = compare(src, dst) if dst.exists() else None
            if state == "diverged":
                n["conflicts"] += 1
                log(f"  CONFLICT {rel}: content differs from {dst.name}; kept both")
                continue
            if state in ("same", "b_longer"):
                action = "deduped"           # the archive already holds all of it
            elif owned:
                action = "updated" if state else "archived"
            else:
                continue                     # another host's entry: its owner archives it
            if dry:
                print(f"{action} (dry run): {rel}")
                n[action] += 1
                continue
            if action != "deduped":
                compress(src, dst)
                if is_transcript(rel):
                    write_condensed(dst, condensed_path(dst))
            src.unlink()
            n[action] += 1
            renames[str(rel)] = str(rel) + ".zst"
        except (OSError, RuntimeError, subprocess.CalledProcessError) as e:
            n["errors"] += 1
            log(f"  ERROR {rel}: {e}")
    if not dry:
        remap_manifest(store, renames)
    log("archive: " + ", ".join(f"{v} {k}" for k, v in n.items()))
    return 1 if n["errors"] or n["conflicts"] else 0


# ── run / hook ───────────────────────────────────────────────────────────────

def cmd_run(conf, dry=False):
    STATE_DIR.mkdir(parents=True, exist_ok=True)
    with open(STATE_DIR / "run.lock", "a") as lock:
        try:
            fcntl.flock(lock, fcntl.LOCK_EX | fcntl.LOCK_NB)
        except BlockingIOError:
            log("run: another run is in progress")
            return 0
        status = 0
        for step in (cmd_collect, cmd_pull, cmd_archive):
            try:
                status |= step(conf, dry)
            except Exception as e:  # one step failing must not block the others
                log(f"{step.__name__[4:]}: FAILED: {e!r}")
                status = 1
        return status


def spawn_run(conf):
    """Start `run` detached, at most every RUN_INTERVAL_HOURS."""
    STATE_DIR.mkdir(parents=True, exist_ok=True)
    stamp = STATE_DIR / "last_run"
    interval = float(conf.get("RUN_INTERVAL_HOURS", 6)) * 3600
    try:
        if time.time() - float(stamp.read_text()) < interval:
            return
    except (OSError, ValueError):
        pass
    stamp.write_text(str(time.time()))
    logfile = STATE_DIR / "run.log"
    if logfile.exists() and logfile.stat().st_size > 1 << 20:
        os.replace(logfile, logfile.with_suffix(".log.1"))
    with open(logfile, "a") as out:
        subprocess.Popen([sys.executable, str(Path(__file__).resolve()), "run"],
                         stdin=subprocess.DEVNULL, stdout=out, stderr=subprocess.STDOUT,
                         start_new_session=True)


def cmd_hook(conf):
    event = json.load(sys.stdin)
    if event.get("hook_event_name") == "SessionStart":
        spawn_run(conf)
        return 0
    transcript = event.get("transcript_path")
    if not transcript:
        raise ValueError("hook payload has no transcript_path")
    c = Collector(CLAUDE_ROOT.resolve(), Path(conf["CLAUDE_LOG_DIR"]), conf["LOG_HOST"])
    c.collect(c.session_files(Path(transcript).expanduser().resolve()))
    return 0


# ── migrate ──────────────────────────────────────────────────────────────────

LEGACY_NAME = re.compile(rf"^(?P<host>[A-Za-z0-9-]+)_(?:\d{{8}}_\d{{6}}_)?(?P<rest>{SID}.*)$")
LEGACY_TOP = re.compile(rf"^(?P<host>[A-Za-z0-9-]+)_(?P<proj>[^/]+?)_(?P<rest>{SID}\.jsonl)$")


def migrate_plan(store, host_map):
    """Map every legacy store path to its place in the current layout."""
    def norm(name):
        m = LEGACY_NAME.match(name)
        if not m:
            return name
        return f"{host_map.get(m['host'], m['host'])}_{m['rest']}"

    raw_projects = {}
    plan = []
    for src, rel in store_files(store):
        parts = rel.parts
        if parts[0] == "_machine":
            continue
        if parts[0] == "raw" and len(parts) >= 3:
            h = host_map.get(parts[1], parts[1])
            if parts[2] == "projects" and len(parts) >= 5:
                enc = store / Path(*parts[:4])
                if enc not in raw_projects:
                    cwd = next((c for t in sorted(enc.glob("*.jsonl")) if (c := first_cwd(t))), None)
                    raw_projects[enc] = sanitize(Path(cwd).name if cwd else parts[3].lstrip("-"))
                proj, name = raw_projects[enc], parts[4]
                if len(parts) == 5 and name.endswith(".jsonl") and SID_RE.match(name[:-6]):
                    new = Path(proj, f"{h}_{name}")
                elif len(parts) > 5 and SID_RE.match(name):
                    new = Path(proj, f"{h}_{name}", *parts[5:])
                else:
                    new = Path("_machine", h, *parts[2:])
            else:
                new = Path("_machine", h, *parts[2:])
        elif parts[0] == "hpc" and len(parts) >= 3:
            new = Path(parts[1], norm(parts[2]), *parts[3:])
        elif len(parts) == 1:
            m = LEGACY_TOP.match(parts[0])
            if LEGACY_NAME.match(parts[0]) and parts[0].endswith(".jsonl"):
                cwd = first_cwd(src)
                new = Path(sanitize(Path(cwd).name) if cwd else "unknown", norm(parts[0]))
            elif m:
                new = Path(sanitize(m["proj"]), norm(f"{m['host']}_{m['rest']}"))
            else:
                continue
        else:
            new = Path(parts[0], norm(parts[1]), *parts[2:])
        if new != rel:
            plan.append((rel, new))
    return consolidate(store, plan)


def consolidate(store, plan):
    """Older exports filed a session under the cwd at each turn, so one session
    can sit in several projects. File every copy under the project of the cwd
    it started in; the move loop then keeps the longest copy."""
    moves = dict(plan)
    final = {}
    for _, rel in store_files(store):
        if rel.parts[0] != "_machine":
            final[rel] = moves.get(rel, rel)
    groups = {}
    for old, new in final.items():
        if new.parts[0] != "_machine" and len(new.parts) >= 2:
            m = re.match(rf"^([A-Za-z0-9-]+_{SID})(?=\.|/|$)", new.parts[1])
            if m:
                groups.setdefault(m[1], []).append((old, new))
    for key, members in groups.items():
        if len({new.parts[0] for _, new in members}) < 2:
            continue
        cwd = None
        for old, new in members:
            if is_transcript(new):
                cwd = first_cwd(store / old)
                if cwd:
                    break
        if not cwd:
            continue
        proj = sanitize(Path(cwd).name)
        for old, new in members:
            if new.parts[0] != proj:
                moves[old] = Path(proj, *new.parts[1:])
    return [(old, new) for old, new in moves.items() if old != new]


def cmd_migrate(conf, dry=False, host_map=None):
    store = Path(conf["CLAUDE_LOG_DIR"])
    plan = migrate_plan(store, host_map or {})
    n = dict(moved=0, dropped_dup=0, replaced=0, conflicts=0)
    renames, regen = {}, set()
    # Where each destination's content lives so far; lets a dry run see the
    # collisions that earlier moves in the same pass would create.
    placed = {}
    for old, new in sorted(plan, key=lambda x: (str(x[1]), str(x[0]))):
        src, dst = store / old, store / new
        current = placed.get(new) or (dst if dst.exists() else None)
        if current is None:
            action = "moved"
        elif new.name.endswith(".condensed.md"):
            action = "dropped_dup"           # regenerated below if its transcript changes
        else:
            state = compare(src, current)
            action = {"same": "dropped_dup", "b_longer": "dropped_dup",
                      "a_longer": "replaced", "diverged": "conflicts"}[state]
        n[action] += 1
        if action in ("moved", "replaced"):
            placed[new] = src if dry else dst
        if dry:
            if action != "moved":
                print(f"{action}: {old} -> {new}")
            continue
        if action == "conflicts":
            stem, suffix = new.name.split(".", 1)
            k = 1
            while (store / new.parent / f"{stem}.conflict{k}.{suffix}").exists():
                k += 1
            new = new.parent / f"{stem}.conflict{k}.{suffix}"
            dst = store / new
            log(f"  CONFLICT {old}: diverges from existing; kept as {new}")
        if action == "dropped_dup":
            src.unlink()
        else:
            dst.parent.mkdir(parents=True, exist_ok=True)
            os.replace(src, dst)
            if action == "replaced" and dst.suffix == ".zst" and is_transcript(new):
                regen.add(dst)
        renames[str(old)] = str(new)
    if not dry:
        for z in sorted(regen):
            write_condensed(z, condensed_path(z))
        remap_manifest(store, renames)
        for top in ("raw", "hpc"):
            prune(store / top)
        for d in sorted({(store / o).parent for o, _ in plan} - {store}, key=lambda p: -len(p.parts)):
            prune(d)
    log(f"migrate{' (dry run)' if dry else ''}: " + ", ".join(f"{v} {k}" for k, v in n.items()))
    return 1 if n["conflicts"] else 0


def prune(d):
    """Remove leftover lock/.DS_Store files and empty dirs under d."""
    if not d.is_dir():
        return
    for p in sorted(d.rglob("*"), key=lambda p: -len(p.parts)):
        if p.is_file() and (p.name == ".DS_Store" or p.name.endswith(".lock")):
            p.unlink()
        elif p.is_dir() and not any(p.iterdir()):
            p.rmdir()
    if not any(d.iterdir()):
        d.rmdir()


# ── main ─────────────────────────────────────────────────────────────────────

def main():
    ap = argparse.ArgumentParser(description=__doc__.split("\n\n")[0])
    ap.add_argument("command", choices=["collect", "pull", "archive", "run", "hook", "migrate"])
    ap.add_argument("--dry-run", action="store_true")
    ap.add_argument("--min-age-days", type=float, default=3.0,
                    help="archive: skip transcripts modified more recently")
    ap.add_argument("--all-hosts", action="store_true",
                    help="archive: also compress entries owned by other hosts")
    ap.add_argument("--host-map", default="",
                    help="migrate: rename host prefixes, e.g. klc0401=quest,klc0402=quest")
    args = ap.parse_args()
    conf = load_config()
    if args.command == "hook":
        return cmd_hook(conf)
    if args.command == "archive":
        return cmd_archive(conf, args.dry_run, args.min_age_days, args.all_hosts)
    if args.command == "migrate":
        host_map = dict(kv.split("=", 1) for kv in args.host_map.split(",") if "=" in kv)
        return cmd_migrate(conf, args.dry_run, host_map)
    return {"collect": cmd_collect, "pull": cmd_pull, "run": cmd_run}[args.command](conf, args.dry_run)


if __name__ == "__main__":
    sys.exit(main())
