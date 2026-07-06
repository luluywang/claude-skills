#!/usr/bin/env python3
"""
condense_log.py — Distill a Claude Code session transcript into readable markdown.

Keeps the decision-relevant content (user messages, assistant text and thinking,
tool calls, truncated tool results) and drops the bulk (file snapshots, base64
images, signatures, usage metadata, UI bookkeeping rows).

Usage:
    python3 condense_log.py <transcript.jsonl[.gz|.zst]> [-o OUTPUT.md]

With no -o, writes alongside the input as <basename>.condensed.md.
Reads .jsonl, .jsonl.gz, and .jsonl.zst transparently.
"""

import argparse
import gzip
import io
import json
import subprocess
import sys
from pathlib import Path

# Truncation limits (characters). Tool results are the bulk of a transcript;
# the full text stays recoverable from the .zst archive.
LIMITS = {
    "user_text": 6000,
    "assistant_text": 6000,
    "thinking": 2000,
    "tool_input": 1500,
    "tool_result": 1200,
    "system": 400,
}

# Record types that carry no decision content.
SKIP_TYPES = {
    "file-history-snapshot", "attachment", "mode", "ai-title",
    "last-prompt", "queue-operation", "summary", "pr-link",
}


def open_transcript(path: Path):
    """Open .jsonl, .jsonl.gz, or .jsonl.zst as a text stream."""
    if path.suffix == ".gz":
        return gzip.open(path, "rt", encoding="utf-8", errors="replace")
    if path.suffix == ".zst":
        proc = subprocess.Popen(
            ["zstd", "-dc", "--long=31", str(path)], stdout=subprocess.PIPE
        )
        return io.TextIOWrapper(proc.stdout, encoding="utf-8", errors="replace")
    return open(path, encoding="utf-8", errors="replace")


def truncate(text, limit):
    """Head+tail truncation with an explicit marker."""
    if not isinstance(text, str):
        text = str(text)
    if len(text) <= limit:
        return text
    head = int(limit * 0.75)
    tail = limit - head
    omitted = len(text) - head - tail
    return f"{text[:head]}\n... [{omitted} chars omitted] ...\n{text[-tail:]}"


def fence(text, lang=""):
    """Wrap text in a code fence that cannot be broken by embedded backticks."""
    longest = 0
    run = 0
    for ch in text:
        run = run + 1 if ch == "`" else 0
        longest = max(longest, run)
    ticks = "`" * max(3, longest + 1)
    return f"{ticks}{lang}\n{text}\n{ticks}"


def content_blocks(message):
    """Normalize message content to a list of blocks."""
    content = message.get("content")
    if isinstance(content, str):
        return [{"type": "text", "text": content}]
    if isinstance(content, list):
        return content
    return []


def render_tool_result_content(content):
    """tool_result content may be a string or a list of text/image blocks."""
    if isinstance(content, str):
        return content
    if isinstance(content, list):
        parts = []
        for block in content:
            if not isinstance(block, dict):
                continue
            if block.get("type") == "text":
                parts.append(block.get("text", ""))
            elif block.get("type") == "image":
                parts.append("[image omitted]")
        return "\n".join(parts)
    return str(content)


def condense(in_path: Path, out):
    header_written = False
    n_in = 0
    with open_transcript(in_path) as f:
        for line in f:
            line = line.strip()
            if not line:
                continue
            n_in += 1
            try:
                rec = json.loads(line)
            except json.JSONDecodeError:
                continue
            rtype = rec.get("type")
            if rtype in SKIP_TYPES:
                continue

            if not header_written and rec.get("sessionId"):
                out.write(f"# Session {rec.get('sessionId')}\n\n")
                out.write(f"- source: {in_path.name}\n")
                out.write(f"- cwd: {rec.get('cwd', '?')}\n")
                out.write(f"- started: {rec.get('timestamp', '?')}\n")
                out.write(f"- version: {rec.get('version', '?')}\n\n")
                header_written = True

            side = " (sidechain)" if rec.get("isSidechain") else ""

            if rtype == "user":
                msg = rec.get("message", {})
                for block in content_blocks(msg):
                    if not isinstance(block, dict):
                        continue
                    btype = block.get("type")
                    if btype == "text":
                        text = block.get("text", "")
                        # Skip harness-injected reminders; keep real user words
                        if text.startswith("<system-reminder>"):
                            continue
                        out.write(f"## USER{side}\n\n")
                        out.write(truncate(text, LIMITS["user_text"]) + "\n\n")
                    elif btype == "tool_result":
                        text = render_tool_result_content(block.get("content"))
                        status = " (error)" if block.get("is_error") else ""
                        out.write(f"### TOOL RESULT{status}{side}\n\n")
                        out.write(fence(truncate(text, LIMITS["tool_result"])) + "\n\n")

            elif rtype == "assistant":
                msg = rec.get("message", {})
                model = msg.get("model", "")
                for block in content_blocks(msg):
                    if not isinstance(block, dict):
                        continue
                    btype = block.get("type")
                    if btype == "text":
                        out.write(f"## ASSISTANT ({model}){side}\n\n")
                        out.write(truncate(block.get("text", ""), LIMITS["assistant_text"]) + "\n\n")
                    elif btype == "thinking":
                        thinking = block.get("thinking", "")
                        if thinking.strip():
                            out.write(f"### THINKING{side}\n\n")
                            out.write(fence(truncate(thinking, LIMITS["thinking"])) + "\n\n")
                    elif btype == "tool_use":
                        name = block.get("name", "?")
                        try:
                            arg_str = json.dumps(block.get("input", {}), ensure_ascii=False)
                        except (TypeError, ValueError):
                            arg_str = str(block.get("input"))
                        out.write(f"### TOOL CALL: {name}{side}\n\n")
                        out.write(fence(truncate(arg_str, LIMITS["tool_input"]), "json") + "\n\n")

            elif rtype == "system":
                text = rec.get("content") or rec.get("message") or ""
                if isinstance(text, str) and text.strip():
                    out.write(f"### SYSTEM\n\n")
                    out.write(fence(truncate(text, LIMITS["system"])) + "\n\n")

    return n_in


def default_output(in_path: Path) -> Path:
    name = in_path.name
    for ext in (".jsonl.zst", ".jsonl.gz", ".jsonl"):
        if name.endswith(ext):
            return in_path.with_name(name[: -len(ext)] + ".condensed.md")
    return in_path.with_suffix(".condensed.md")


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("path", help="Transcript (.jsonl, .jsonl.gz, .jsonl.zst)")
    parser.add_argument("-o", "--output", help="Output markdown path (default: alongside input)")
    args = parser.parse_args()

    in_path = Path(args.path)
    if not in_path.exists():
        print(f"Not found: {in_path}", file=sys.stderr)
        return 1
    out_path = Path(args.output) if args.output else default_output(in_path)

    tmp = out_path.with_suffix(out_path.suffix + ".tmp")
    with open(tmp, "w", encoding="utf-8") as out:
        n = condense(in_path, out)
    tmp.replace(out_path)
    print(f"{in_path.name}: {n} records -> {out_path.name} ({out_path.stat().st_size // 1024}KB)")
    return 0


if __name__ == "__main__":
    sys.exit(main())
