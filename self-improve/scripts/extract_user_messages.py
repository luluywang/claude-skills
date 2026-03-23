#!/usr/bin/env python3
"""
extract_user_messages.py — Extract only user messages from a JSONL session file.

Usage:
    python3 extract_user_messages.py <path_to.jsonl> [--max-kb 20]

Outputs plain text of user message content, capped at max_kb kilobytes.
Used to pre-filter large sessions before LLM analysis (reduces cost + context).
"""

import argparse
import gzip
import json
import sys
from pathlib import Path


def extract_text_content(content):
    """Extract plain text from a message content field (string or list of blocks)."""
    if isinstance(content, str):
        return content
    if isinstance(content, list):
        parts = []
        for block in content:
            if isinstance(block, dict) and block.get("type") == "text":
                parts.append(block.get("text", ""))
        return "\n".join(parts)
    return ""


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("path", help="Path to .jsonl or .jsonl.gz file")
    parser.add_argument("--max-kb", type=int, default=20,
                        help="Maximum output size in KB (default: 20)")
    args = parser.parse_args()

    path = Path(args.path)
    max_bytes = args.max_kb * 1024

    opener = gzip.open if path.suffix == ".gz" else open
    mode = "rt"

    output_parts = []
    total_bytes = 0

    try:
        with opener(path, mode, encoding="utf-8", errors="replace") as f:
            for line in f:
                line = line.strip()
                if not line:
                    continue
                try:
                    record = json.loads(line)
                except json.JSONDecodeError:
                    continue

                # Handle both top-level message objects and nested formats
                msg = None
                if isinstance(record, dict):
                    if record.get("type") == "user" and "message" in record:
                        msg = record["message"]
                    elif record.get("type") == "user":
                        msg = record
                    elif "message" in record and isinstance(record["message"], dict):
                        inner = record["message"]
                        if inner.get("role") == "user":
                            msg = inner

                if msg is None:
                    continue

                content = msg.get("content", "")
                text = extract_text_content(content).strip()
                if not text:
                    continue

                chunk = text + "\n\n"
                chunk_bytes = chunk.encode("utf-8")
                if total_bytes + len(chunk_bytes) > max_bytes:
                    # Add truncation notice and stop
                    output_parts.append("[... truncated at max-kb limit ...]\n")
                    break
                output_parts.append(chunk)
                total_bytes += len(chunk_bytes)

    except (OSError, EOFError) as e:
        print(f"[Error reading {path}: {e}]", file=sys.stderr)
        sys.exit(1)

    sys.stdout.write("".join(output_parts))


if __name__ == "__main__":
    main()
