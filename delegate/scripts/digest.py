#!/usr/bin/env python3
"""Collapse a Codex/Cursor JSONL event stream into a compact progress digest.

Reads events.jsonl (mixed codex `item.completed` / cursor `tool_call` shapes) and
prints one line per meaningful action. Thinking deltas are dropped -- they are the
bulk of the stream and none of the signal.
"""
import argparse
import json
import sys


def truncate(s, n):
    s = " ".join(str(s).split())
    return s if len(s) <= n else s[: n - 1] + "…"


def parse(path, root=None):
    """Yield (kind, text) per event. Unparseable lines are skipped, not fatal."""
    def rel(p):
        p = str(p)
        if root and p.startswith(root):
            return p[len(root) :].lstrip("/") or "."
        return p

    session = None
    agent = None
    usage = {}
    turns_done = 0
    lines = []

    with open(path) as fh:
        for raw in fh:
            raw = raw.strip()
            if not raw:
                continue
            try:
                e = json.loads(raw)
            except json.JSONDecodeError:
                continue
            t = e.get("type")

            # --- codex ---
            if t == "thread.started":
                agent, session = "codex", e.get("thread_id")
            elif t == "turn.completed":
                turns_done += 1
                for k, v in (e.get("usage") or {}).items():
                    usage[k] = usage.get(k, 0) + v
            elif t == "turn.failed":
                lines.append(("fail", truncate(e.get("error", "turn failed"), 200)))
            elif t == "item.completed":
                it = e.get("item") or {}
                ity = it.get("type")
                if ity == "agent_message":
                    lines.append(("msg", it.get("text", "")))
                elif ity == "command_execution":
                    code = it.get("exit_code")
                    cmd = truncate(it.get("command", ""), 100)
                    lines.append(("cmd", f"{cmd}  (exit {code})"))
                elif ity == "file_change":
                    for c in it.get("changes") or []:
                        lines.append(("edit", f"{c.get('kind','change')} {rel(c.get('path','?'))}"))

            # --- cursor ---
            elif t == "system" and e.get("subtype") == "init":
                agent, session = "cursor", e.get("session_id")
            elif t == "assistant":
                for c in (e.get("message") or {}).get("content") or []:
                    if c.get("type") == "text" and c.get("text", "").strip():
                        lines.append(("msg", c["text"]))
            elif t == "tool_call" and e.get("subtype") == "completed":
                tc = e.get("tool_call") or {}
                # Real calls are dict-valued *ToolCall keys; siblings like toolCallId
                # and startedAtMs are metadata and must be skipped.
                for name, body in tc.items():
                    if not name.endswith("ToolCall") or not isinstance(body, dict):
                        continue
                    args = body.get("args") or {}
                    kind = name[: -len("ToolCall")]
                    if "command" in args:
                        lines.append(("cmd", truncate(args["command"], 100)))
                    elif "path" in args:
                        lines.append(("edit", f"{kind} {rel(args['path'])}"))
                    else:
                        lines.append(("tool", truncate(kind, 60)))
            elif t == "result":
                turns_done += 1
                u = e.get("usage") or {}
                for k, v in u.items():
                    if isinstance(v, int):
                        usage[k] = usage.get(k, 0) + v
                if e.get("is_error"):
                    lines.append(("fail", truncate(e.get("result", "error"), 200)))

    return agent, session, usage, turns_done, lines


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("events")
    ap.add_argument("--tail", type=int, default=40, help="show last N action lines")
    ap.add_argument("--full", action="store_true", help="do not truncate agent messages")
    ap.add_argument("--root", default=None, help="strip this prefix from file paths")
    a = ap.parse_args()

    try:
        agent, session, usage, turns, lines = parse(a.events, a.root)
    except FileNotFoundError:
        print(f"no event log at {a.events}", file=sys.stderr)
        return 1

    print(f"agent={agent or '?'} session={session or '?'} turns_completed={turns} events={len(lines)}")
    shown = lines if a.tail <= 0 else lines[-a.tail :]
    if len(shown) < len(lines):
        print(f"... {len(lines) - len(shown)} earlier lines omitted ...")
    for kind, text in shown:
        body = text if (a.full and kind == "msg") else truncate(text, 160)
        print(f"  [{kind}] {body}")
    if usage:
        bits = ", ".join(f"{k}={v}" for k, v in sorted(usage.items()))
        print(f"tokens: {bits}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
