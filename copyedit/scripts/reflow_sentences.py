#!/usr/bin/env python3
import re
import sys
from pathlib import Path

ABBREVIATIONS = [
    "U.S.", "U.K.", "e.g.", "i.e.", "etc.", "vs.",
    "Mr.", "Mrs.", "Ms.", "Dr.", "Prof.", "Sr.", "Jr.",
    "Inc.", "Co.", "Corp.", "Ltd.", "Fig.", "Eq.", "Ch.",
    "No.", "Vol.", "pp.", "al.", "et al.",
]

# Environments to leave entirely intact (no reflow inside)
SKIP_ENVS = {
    'table', 'table*', 'tabular', 'tabular*', 'tabularx', 'longtable',
    'threeparttable', 'adjustbox', 'supertabular', 'xtabular',
    'equation', 'equation*', 'align', 'align*', 'gather', 'gather*',
    'multline', 'multline*', 'flalign', 'flalign*', 'alignat', 'alignat*'
}

def protect_abbreviations(text: str) -> tuple[str, list[str]]:
    placeholders = []
    def repl(match):
        placeholders.append(match.group(0))
        return f"<ABBR{len(placeholders)-1}>"

    # Protect known abbreviations (case sensitive)
    pattern = r"(" + "|".join(map(re.escape, sorted(ABBREVIATIONS, key=len, reverse=True))) + r")"
    text = re.sub(pattern, repl, text)

    # Protect initials like "A. B. Smith" or "J. D."
    def init_repl(m):
        placeholders.append(m.group(0))
        return f"<ABBR{len(placeholders)-1}>"

    text = re.sub(r"\b([A-Z])\.\s?([A-Z])\.\b", init_repl, text)
    text = re.sub(r"\b([A-Z])\.\b", init_repl, text)
    return text, placeholders

def restore_placeholders(s: str, placeholders: list[str]) -> str:
    for i, val in enumerate(placeholders):
        s = s.replace(f"<ABBR{i}>", val)
    return s

def split_sentences(paragraph: str) -> list[str]:
    # Normalize spaces
    para = re.sub(r"\s+", " ", paragraph.strip())
    if not para:
        return []

    protected, placeholders = protect_abbreviations(para)

    # Allow sentence boundaries before LaTeX command starts too, but we split only on punctuation
    # Split on . ! ? followed by space or end, keeping the delimiter
    parts = re.split(r"(?<=[.!?])\s+(?=[^{}])|(?<=[.!?])$", protected)
    sentences = []
    for part in parts:
        if not part:
            continue
        s = restore_placeholders(part.strip(), placeholders)
        sentences.append(s)
    return sentences

# LaTeX line comments (unescaped % through end of line) must stay at end-of-line
# or they silently comment out whatever follows on the joined paragraph. Protect
# them with placeholders that restore with a trailing newline.
LINE_COMMENT_RE = re.compile(r"(?<!\\)%[^\n]*")

def protect_line_comments(line: str, start_idx: int) -> tuple[str, list[str]]:
    """Replace unescaped '%...' comments with <LCOMMENT{i}> placeholders.
    start_idx lets callers accumulate a single numbering across many lines.
    """
    captured: list[str] = []
    def repl(m: re.Match) -> str:
        captured.append(m.group(0))
        return f"<LCOMMENT{start_idx + len(captured) - 1}>"
    protected = LINE_COMMENT_RE.sub(repl, line)
    return protected, captured

def restore_line_comments(s: str, comments: list[str]) -> str:
    """Restore each <LCOMMENT{i}> placeholder as '{comment}\\n' so the caller
    can split on '\\n' and emit each segment on its own line — keeping every
    LaTeX comment at end-of-line, as LaTeX requires."""
    for i, ph in enumerate(comments):
        s = s.replace(f"<LCOMMENT{i}>", f"{ph}\n")
    return s

INLINE_COMMANDS = {
    # citations and references
    'cite', 'citep', 'citet', 'parencite', 'footcite', 'textcite', 'autocite',
    'ref', 'eqref', 'pageref',
    # inline formatting
    'textit', 'textbf', 'emph', 'texttt', 'textsc', 'underline', 'textcolor',
    # misc inline
    'footnote', 'url', 'href', 'LaTeX', 'TeX', 'scalebox', 'phantom', 'ldots'
}

def is_comment_only_line(line: str) -> bool:
    """True for lines whose only content is a LaTeX comment (no live text)."""
    ls = line.lstrip()
    return bool(ls) and ls.startswith('%')

def is_command_line(line: str) -> bool:
    ls = line.lstrip()
    if not ls:
        return False
    # Comment-only lines are handled separately: mid-paragraph annotations
    # must NOT flush (that inserts a blank = LaTeX paragraph break).
    if ls.startswith('%'):
        return False
    if not ls.startswith('\\'):
        return False
    m = re.match(r"\\([A-Za-z*]+)", ls)
    if not m:
        return True
    cmd = m.group(1).rstrip('*')
    # Treat begin/end as block
    if cmd in {'begin', 'end'}:
        return True
    # Inline commands should be kept within paragraph buffer
    if cmd in INLINE_COMMANDS:
        return False
    # Heuristic: commands followed by '{' and then ONLY '}' on the same line are likely block? Keep as command line
    return True

def buffer_ends_sentence(buf: list[str]) -> bool:
    """True if the buffer's last live text looks like a finished sentence.
    Used to decide whether flushing before display math should insert a
    blank line (paragraph break) or keep the lead-in attached."""
    for bl in reversed(buf):
        pl, _ = protect_line_comments(bl, 0)
        live = pl.strip()
        if not live:
            continue
        return bool(re.search(r'[.!?]\s*$', live.rstrip('}')))
    return True

def main(path: str):
    p = Path(path)
    src = p.read_text(encoding='utf-8')

    out_lines = []
    buffer = []
    in_skip_env = None
    in_math = None  # Track \[ ... \] or $$ ... $$
    begin_env_re = re.compile(r"^\\begin\{([^}]+)\}")
    end_env_re = re.compile(r"^\\end\{([^}]+)\}")

    def flush_buffer(paragraph_break: bool = True):
        nonlocal buffer
        if not buffer:
            return
        # Protect LaTeX line comments in each buffer line BEFORE joining,
        # so end-of-line comments don't consume text from the next line
        # once newlines collapse to spaces.
        all_comments: list[str] = []
        protected_lines: list[str] = []
        for bl in buffer:
            pl, caps = protect_line_comments(bl, len(all_comments))
            protected_lines.append(pl)
            all_comments.extend(caps)
        paragraph = " ".join(protected_lines)
        for s in split_sentences(paragraph):
            # Restore comments with trailing newlines, then split so each
            # comment sits alone at end-of-line.
            restored = restore_line_comments(s, all_comments)
            for sub in restored.split('\n'):
                sub = sub.strip()
                if sub:
                    out_lines.append(sub)
        if paragraph_break:
            out_lines.append("")  # keep paragraph break
        buffer = []

    lines = src.splitlines()
    for line in lines:
        # Check for math delimiters \[ and \] (display math)
        if in_math == 'bracket':
            out_lines.append(line)
            if r'\]' in line:
                in_math = None
            continue
        elif line.strip().startswith(r'\['):
            # Lead-ins like "utility is" should not become their own paragraph.
            flush_buffer(paragraph_break=buffer_ends_sentence(buffer))
            out_lines.append(line)
            if not r'\]' in line:
                in_math = 'bracket'
            continue

        # Track environments to skip
        m_begin = begin_env_re.match(line.strip())
        m_end = end_env_re.match(line.strip())

        if m_begin:
            env = m_begin.group(1)
            # Same lead-in rule for display math environments; other envs
            # (fact, figure, ...) keep a paragraph break when the buffer
            # already ends a sentence.
            if env in SKIP_ENVS:
                flush_buffer(paragraph_break=buffer_ends_sentence(buffer))
            else:
                flush_buffer(paragraph_break=True)
            if in_skip_env is None and env in SKIP_ENVS:
                in_skip_env = env
            out_lines.append(line)
            continue

        if m_end:
            # Flush fact/equation body without a trailing blank so we do not
            # insert a paragraph break before \end{...}.
            flush_buffer(paragraph_break=False)
            env = m_end.group(1)
            out_lines.append(line)
            if in_skip_env == env:
                in_skip_env = None
            continue

        if in_skip_env is not None:
            out_lines.append(line)
            continue

        # Paragraph/command handling outside skipped envs
        if not line.strip():
            flush_buffer(paragraph_break=True)
            out_lines.append("")
            continue

        # Standalone % lines: mid-paragraph annotations (HARDCODED, etc.)
        # stay in the buffer so we do not insert a blank paragraph break.
        # Structural/decorative comments with an empty buffer pass through.
        if is_comment_only_line(line):
            if buffer:
                buffer.append(line.strip())
            else:
                out_lines.append(line)
            continue

        if is_command_line(line):
            flush_buffer(paragraph_break=True)
            out_lines.append(line)
            continue

        # Otherwise, paragraph text
        buffer.append(line.strip())

    # Flush any remaining paragraph
    flush_buffer(paragraph_break=True)

    # Remove trailing extra blank lines collapse
    result = "\n".join(out_lines)
    # Avoid multiple consecutive blank lines > 2
    result = re.sub(r"\n{3,}", "\n\n", result)
    p.write_text(result, encoding='utf-8')

if __name__ == '__main__':
    if len(sys.argv) != 2:
        print("Usage: reflow_sentences.py <tex-file>", file=sys.stderr)
        sys.exit(1)
    main(sys.argv[1])
