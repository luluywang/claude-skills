#!/usr/bin/env bash
# verify_coverage.sh — Blocking completeness gate for an assembled parse.
#
# WHY THIS EXISTS
# ---------------
# The pipeline used to lose whole subsections silently. On MS AER-2026-1101 it
# dropped section 5.5 (Quantification — the source of the paper's headline
# result), Appendix G (Numerical Simulation) and Appendix H, and every stage
# reported success. The page text was extracted correctly and sat unused in
# layout/; the loss happened when a 27-page "section" was handed to the text
# cleaner in one piece and the cleaner returned a summary of the head of its
# input. Nothing downstream compared what went in against what came out.
#
# This gate does that comparison. It is deterministic, it runs before the output
# is handed to the user, and it exits non-zero when content is missing.
#
# Two checks:
#   1. HEADER COVERAGE  — every body header in headers.tsv appears in the
#      assembled markdown.
#   2. PAGE COVERAGE    — the section page ranges in structure.json tile
#      1..total_pages with no gap.
#
# Usage:
#   verify_coverage.sh <cache_dir> [assembled.md]
#     Defaults to <cache_dir>/assembled.md, then <cache_dir>/../output/*.md
#
# Exit: 0 = complete (safe to deliver)
#       1 = content missing (DO NOT deliver; re-clean the named units)
#       2 = usage / prerequisite error

set -uo pipefail

if [[ $# -lt 1 ]]; then
  echo "usage: verify_coverage.sh <cache_dir> [assembled.md]" >&2
  exit 2
fi

CACHE_DIR="${1%/}"
HEADERS="$CACHE_DIR/headers.tsv"
STRUCTURE="$CACHE_DIR/structure.json"

if [[ ! -f "$HEADERS" ]]; then
  echo "verify_coverage.sh: missing $HEADERS" >&2
  echo "  run: scripts/extract_headers.sh \"$CACHE_DIR\"" >&2
  exit 2
fi

# Locate the assembled markdown.
if [[ $# -ge 2 ]]; then
  ASSEMBLED="$2"
elif [[ -f "$CACHE_DIR/assembled.md" ]]; then
  ASSEMBLED="$CACHE_DIR/assembled.md"
else
  ASSEMBLED=$(find "$CACHE_DIR/.." -maxdepth 2 -name '*.md' -not -name '*_findings.md' \
    -not -name '*_qa*' 2>/dev/null | head -1)
fi

if [[ -z "${ASSEMBLED:-}" || ! -f "$ASSEMBLED" ]]; then
  echo "verify_coverage.sh: cannot find assembled markdown" >&2
  exit 2
fi

echo "verify_coverage.sh"
echo "  headers:   $HEADERS"
echo "  assembled: $ASSEMBLED"
echo

fail=0

# ---------------------------------------------------------------------------
# Check 1: header coverage
# ---------------------------------------------------------------------------
# Match on a normalised signature, not the literal string: the cleaner
# legitimately reflows, re-capitalises and lightly rewords headings. Observed
# variants that must still match include "4 Difference-in-Differences" rendered
# as "## 4. Difference-in-Differences", and a PDF contents entry reading
# "F Condition Costs Functions" whose body heading reads
# "Appendix F. Condition on Cost Functions".
#
# Normalisation, applied identically to both sides:
#   lowercase -> non-alphanumerics to spaces -> drop words under 4 characters
#   -> strip one trailing "s" (crude stemming: costs/cost, differences/difference)
# The signature is the first two surviving words of the title, and the match
# allows up to three intervening words so that dropped stop-words and inserted
# prepositions do not break it. Two stemmed content words in near-adjacency is
# specific enough not to collide with running prose.

normalise() {
  tr 'A-Z' 'a-z' | tr -cs 'a-z0-9' ' ' | tr -s ' ' | awk '{
    out = ""
    for (i = 1; i <= NF; i++) {
      w = $i
      if (length(w) < 4) continue
      sub(/s$/, "", w)
      out = out " " w
    }
    print out
  }'
}

# Restrict the haystack to HEADING lines. Matching against the whole document
# body is too permissive: section titles are built from ordinary words that recur
# in prose, so "5.5 Quantification" matched the introduction's roadmap sentence
# ("...welfare analysis, and quantification exercise") and passed while the
# subsection itself was absent. The question this gate asks is not "does this
# word appear somewhere" but "does this section appear as a section", so the
# haystack is the output's own headings: ATX headings, banner lines, and bold
# run-in headers of the kind economics papers use for named subsections.
heading_file=$(mktemp)
grep -E '^[[:space:]]*(#{1,6}[[:space:]]|##[[:space:]]+[A-Z0-9]|\*\*[^*]+\*\*[[:space:]]*:?[[:space:]]*$)' \
  "$ASSEMBLED" > "$heading_file" || true

if [[ ! -s "$heading_file" ]]; then
  echo "WARN  no headings found in the assembled markdown; falling back to full-text match" >&2
  cp "$ASSEMBLED" "$heading_file"
fi

norm_file=$(mktemp)
normalise < "$heading_file" | tr -s ' ' > "$norm_file"

missing=()
checked=0

while IFS=$'\t' read -r page kind label title; do
  [[ "$page" == "page" ]] && continue          # header row
  [[ "$kind" == "toc" ]] && continue           # contents-page rows are the cross-check
  [[ -z "${title// }" ]] && continue

  read -r w1 w2 _ <<<"$(printf '%s' "$title" | normalise)"
  [[ -z "${w1:-}" ]] && continue               # title has no matchable content word

  if [[ -n "${w2:-}" ]]; then
    pat="$w1( [a-z0-9]+){0,3} $w2"
  else
    pat="(^| )$w1( |$)"
  fi

  checked=$((checked + 1))
  if ! grep -qE "$pat" "$norm_file"; then
    missing+=("p.$page  $label  $title")
  fi
done < "$HEADERS"

if [[ ${#missing[@]} -gt 0 ]]; then
  fail=1
  echo "FAIL  header coverage: ${#missing[@]} of $checked body headers absent from the output"
  for m in "${missing[@]}"; do echo "        $m"; done
  echo
  echo "      These sections exist in the PDF and were extracted to"
  echo "      $CACHE_DIR/layout/ but did not reach the assembled markdown."
  echo "      Re-run clean_text on the pages listed above, in units of at most"
  echo "      6 pages, and re-assemble."
  echo
else
  echo "PASS  header coverage: all $checked body headers present"
fi

# ---------------------------------------------------------------------------
# Check 2: page coverage from structure.json
# ---------------------------------------------------------------------------
if [[ -f "$STRUCTURE" ]]; then
  total=$(sed -n 's/.*"total_pages"[[:space:]]*:[[:space:]]*\([0-9]*\).*/\1/p' \
          "$CACHE_DIR/config.json" 2>/dev/null | head -1)
  [[ -z "$total" ]] && total=$(find "$CACHE_DIR/layout" -name 'page_*.txt' | wc -l | tr -d ' ')

  # Collect every "N-M" or "N" appearing in a "pages" field.
  gaps=$(python3 - "$STRUCTURE" "$total" <<'PY' 2>/dev/null
import json, re, sys
try:
    doc = json.load(open(sys.argv[1]))
except Exception:
    sys.exit(0)
total = int(sys.argv[2])
covered = set()

def absorb(v):
    for a, b in re.findall(r'(\d+)\s*[-–]\s*(\d+)', str(v)):
        covered.update(range(int(a), int(b) + 1))
    s = re.sub(r'\d+\s*[-–]\s*\d+', '', str(v))
    covered.update(int(n) for n in re.findall(r'\d+', s))

def walk(o):
    if isinstance(o, dict):
        for k, v in o.items():
            if 'page' in k.lower():
                absorb(v)
            else:
                walk(v)
    elif isinstance(o, list):
        for v in o:
            walk(v)

walk(doc)
gaps, run = [], []
for p in range(1, total + 1):
    if p not in covered:
        run.append(p)
    elif run:
        gaps.append((run[0], run[-1])); run = []
if run:
    gaps.append((run[0], run[-1]))
print(';'.join(f"{a}-{b}" if a != b else str(a) for a, b in gaps))
PY
)
  if [[ -n "${gaps:-}" ]]; then
    fail=1
    echo "FAIL  page coverage: pages absent from every section range in structure.json"
    echo "        $gaps"
    echo "      A page in no section range is a page no cleaning unit will read."
    echo
  else
    echo "PASS  page coverage: sections tile pages 1-$total"
  fi
else
  echo "WARN  no structure.json — page-coverage check skipped"
fi

rm -f "$norm_file" "$heading_file"

echo
if [[ $fail -ne 0 ]]; then
  echo "DELIVERY BLOCKED: the parse is incomplete. Fix and re-run." >&2
  exit 1
fi
echo "Parse is complete — safe to deliver."
exit 0
