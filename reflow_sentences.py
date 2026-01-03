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

INLINE_COMMANDS = {
    # citations and references
    'cite', 'citep', 'citet', 'parencite', 'footcite', 'textcite', 'autocite',
    'ref', 'eqref', 'pageref',
    # inline formatting
    'textit', 'textbf', 'emph', 'texttt', 'textsc', 'underline', 'textcolor',
    # misc inline
    'footnote', 'url', 'href', 'LaTeX', 'TeX', 'scalebox', 'phantom', 'ldots'
}

def is_command_line(line: str) -> bool:
    ls = line.lstrip()
    if not ls:
        return False
    if ls.startswith('%'):
        return True
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

def main(path: str):
    p = Path(path)
    src = p.read_text(encoding='utf-8')

    out_lines = []
    buffer = []
    in_skip_env = None
    in_math = None  # Track \[ ... \] or $$ ... $$
    begin_env_re = re.compile(r"^\\begin\{([^}]+)\}")
    end_env_re = re.compile(r"^\\end\{([^}]+)\}")

    def flush_buffer():
        nonlocal buffer
        if not buffer:
            return
        # Join buffer into one paragraph and split into sentences
        paragraph = " ".join(buffer)
        for s in split_sentences(paragraph):
            out_lines.append(s)
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
            flush_buffer()
            out_lines.append(line)
            if not r'\]' in line:
                in_math = 'bracket'
            continue

        # Track environments to skip
        m_begin = begin_env_re.match(line.strip())
        m_end = end_env_re.match(line.strip())

        if m_begin:
            # Flush any pending paragraph before starting a new environment
            flush_buffer()
            env = m_begin.group(1)
            if in_skip_env is None and env in SKIP_ENVS:
                in_skip_env = env
            out_lines.append(line)
            continue

        if m_end:
            # Flush any pending paragraph before closing environments
            flush_buffer()
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
            flush_buffer()
            out_lines.append("")
            continue

        if is_command_line(line):
            flush_buffer()
            out_lines.append(line)
            continue

        # Otherwise, paragraph text
        buffer.append(line.strip())

    # Flush any remaining paragraph
    flush_buffer()

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
