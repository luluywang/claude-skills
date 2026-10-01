#!/usr/bin/env bash
# extract_headers.sh — Deterministic section-header inventory for a parsed PDF.
#
# WHY THIS EXISTS
# ---------------
# Document structure used to come solely from an LLM reading a truncated blob of
# the paper's prose. That is not reliable: on MS AER-2026-1101 the segmenter was
# shown the line "5.5  Quantification" and omitted it from structure.json anyway,
# then stretched section 5.4's page range over 5.5's pages. Downstream, the text
# cleaner was told it was cleaning 5.4 and silently dropped 5.5 — a whole
# subsection, including the paper's headline quantitative result, vanished from
# the output with no error anywhere.
#
# This script produces the ground truth the segmenter must match: every
# section-like header in the document, with the page it appears on, found by
# regex over the layout text of EVERY page. No model in the loop, no truncation.
#
# Usage:
#   extract_headers.sh <cache_dir>            # writes <cache_dir>/headers.tsv
#   extract_headers.sh <cache_dir> --stdout   # also print to stdout
#
# Output: TSV with a header row, columns:
#   page    kind    label   title
# where kind is one of: numbered | appendix | appendix_sub | unnumbered | toc
#
# Exit: 0 on success (even if few headers found — that is a finding, not an
#       error), 2 on usage error.

set -uo pipefail

if [[ $# -lt 1 ]]; then
  echo "usage: extract_headers.sh <cache_dir> [--stdout]" >&2
  exit 2
fi

CACHE_DIR="${1%/}"
TO_STDOUT=false
[[ "${2:-}" == "--stdout" ]] && TO_STDOUT=true

if [[ ! -d "$CACHE_DIR/layout" ]]; then
  echo "extract_headers.sh: no layout/ directory in $CACHE_DIR" >&2
  echo "  run process_paper.sh first" >&2
  exit 2
fi

OUT="$CACHE_DIR/headers.tsv"
printf 'page\tkind\tlabel\ttitle\n' > "$OUT"

# Pre-pass: identify contents pages. A table-of-contents page carries many
# dot-leader lines, and its entries wrap in ways that survive the dot-leader
# filter below ("A3 Default and selective default evolution t months after
# becoming 15+" appeared as a bare header from the AER paper's appendix TOC).
# Recording which pages are contents pages lets us drop those phantom body
# headers while still keeping the TOC rows themselves as a cross-check.
# A plain indexed array, not an associative one: macOS ships bash 3.2, which has
# no "declare -A". Page numbers are integers, so an indexed array is the natural
# fit and works on both 3.2 and 5.x.
IS_TOC_PAGE=()
TOC_PAGE_LIST=""
while IFS= read -r -d '' f; do
  page=$(basename "$f" .txt); page="${page#page_}"
  # grep -c prints "0" and *also* exits 1 when there are no matches, so a
  # "|| echo 0" fallback yields two lines and breaks the arithmetic test.
  leaders=$(grep -cE '\.[ ]?\.[ ]?\.[ ]?\.' "$f" 2>/dev/null | head -1)
  if [[ "${leaders:-0}" -ge 5 ]]; then
    IS_TOC_PAGE[$page]=1
    TOC_PAGE_LIST="$TOC_PAGE_LIST $page"
  fi
done < <(find "$CACHE_DIR/layout" -name 'page_*.txt' -print0 | sort -zV)
if [[ -n "$TOC_PAGE_LIST" ]]; then
  echo "extract_headers.sh: contents pages detected:$TOC_PAGE_LIST" >&2
fi

# Walk pages in numeric order. Use layout text: it preserves the leading
# indentation that centred headers carry, and pdftotext -layout keeps a header
# on its own line more reliably than the non-layout extraction.
while IFS= read -r -d '' f; do
  page=$(basename "$f" .txt); page="${page#page_}"

  awk -v page="$page" -v is_toc_page="${IS_TOC_PAGE[$page]-0}" '
    # ---- helpers -------------------------------------------------------
    function trim(s) { gsub(/^[ \t]+|[ \t]+$/, "", s); return s }

    # Count words of >=3 alphabetic characters.
    function alphawords(s,   i, n, parts) {
      n = split(s, parts, /[^A-Za-z]+/)
      i = 0
      for (k = 1; k <= n; k++) if (length(parts[k]) >= 3) i++
      return i
    }

    # A plausible header title: starts uppercase, is not a full sentence,
    # is not mostly digits, is short, and is not a row lifted out of a table.
    function titleish(s,   n) {
      s = trim(s)
      if (s == "")                       return 0
      if (length(s) > 75)                return 0
      if (s !~ /^[A-Z(]/)                return 0
      if (s ~ /[.,;:][ ]*$/)             return 0   # sentence-final punctuation
      if (s ~ /^[0-9 .]+$/)              return 0
      # Table rows leak in through the numbered and letter branches: a wide run
      # of spaces is a column gutter, and a trailing number is a cell value.
      # These produced "F Statistic          218.2" and "4     B" on real papers.
      if (s ~ /   /)                     return 0   # 3+ spaces = column gutter
      if (s ~ /[0-9][0-9.]*[ ]*$/)       return 0   # ends in a figure
      if (s !~ /[A-Za-z]{3}/)            return 0   # no real word at all
      # Reject lines that read as running prose: several lowercase function
      # words in a row is typical of a sentence, not a heading.
      n = gsub(/ (the|of|that|which|we|is|are|this|to|in|and|for) /, " & ", s)
      if (n >= 3)                        return 0
      return 1
    }

    # Emit a body header unless we are on a contents page, where any header-
    # shaped line is a TOC entry rather than the section itself.
    function emit(kind, lab, ttl) {
      if (is_toc_page + 0 == 1) printf "%s\ttoc\t%s\t%s\n", page, lab, ttl
      else                      printf "%s\t%s\t%s\t%s\n", page, kind, lab, ttl
    }

    {
      line = $0
      sub(/\r$/, "", line)
      t = trim(line)
      if (t == "") next

      # ---- table-of-contents entries (dot leaders) --------------------
      # Keep these: an appendix TOC page is often the only place the full
      # appendix inventory appears, and it is a strong cross-check.
      if (t ~ /\.[ ]?\.[ ]?\.[ ]?\./) {
        toc = t
        sub(/[ ]*\.[ .]*\.[ ]*[0-9]*[ ]*$/, "", toc)      # strip leaders + page no
        toc = trim(toc)
        if (match(toc, /^([0-9]+(\.[0-9]+)*|[A-H][0-9]*)[ \t]+/)) {
          lab = substr(toc, 1, RLENGTH); lab = trim(lab)
          ttl = trim(substr(toc, RLENGTH + 1))
          if (ttl != "")
            printf "%s\ttoc\t%s\t%s\n", page, lab, ttl
        }
        next
      }

      # ---- numbered sections and subsections: 1, 1.2, 5.5 ------------
      if (match(t, /^[0-9]+(\.[0-9]+)*\.?[ \t]+/)) {
        lab = substr(t, 1, RLENGTH)
        ttl = substr(t, RLENGTH + 1)
        sub(/\.$/, "", lab); lab = trim(lab)
        if (titleish(ttl)) {
          emit("numbered", lab, trim(ttl))
          next
        }
      }

      # ---- Roman-numeral sections: "I. Introduction", "IV. Results" ---
      # Common in finance and Management Science house styles. Require the
      # trailing period: it separates a real header from prose starting with
      # "I " or "V ", which is otherwise indistinguishable.
      if (match(t, /^[IVXLC]+\.[ \t]+/)) {
        lab = substr(t, 1, RLENGTH); ttl = trim(substr(t, RLENGTH + 1))
        gsub(/[ \t.]+$/, "", lab)
        if (titleish(ttl) && ttl ~ /^[A-Z]([a-z]|[A-Z])/) {
          emit("numbered", lab, ttl)
          next
        }
      }

      # ---- appendix subsections: A1, A2, B3 --------------------------
      if (match(t, /^[A-H][0-9]+\.?[ \t]+/)) {
        lab = substr(t, 1, RLENGTH)
        ttl = substr(t, RLENGTH + 1)
        sub(/\.$/, "", lab); lab = trim(lab)
        if (titleish(ttl)) {
          emit("appendix_sub", lab, trim(ttl))
          next
        }
      }

      # ---- appendix top level: "A Empirical part", "Appendix B. Proof" -
      if (match(t, /^Appendix[ \t]+[A-Z][0-9]*\.?[ \t:]*/)) {
        lab = substr(t, 1, RLENGTH)
        ttl = substr(t, RLENGTH + 1)
        gsub(/[ \t.:]+$/, "", lab)
        if (ttl == "" || titleish(ttl)) {
          emit("appendix", trim(lab), trim(ttl))
          next
        }
      }
      # Bare single-letter appendix headers: "G Numerical Simulation".
      # Require a multi-word title that opens with a real word, so that
      # initials, list items, and wrapped equation fragments such as
      # "D  (U (C))pi(C)" do not match.
      if (match(t, /^[A-H][ \t]+/)) {
        ttl = trim(substr(t, RLENGTH + 1))
        if (titleish(ttl) && ttl ~ /^[A-Z]([a-z]|[A-Z])/ && alphawords(ttl) >= 2) {
          emit("appendix", substr(t, 1, 1), ttl)
          next
        }
      }

      # ---- unnumbered standard headers -------------------------------
      if (t ~ /^(Abstract|ABSTRACT|Introduction|INTRODUCTION|Conclusion|CONCLUSION|Conclusions|References|REFERENCES|Bibliography|Related Literature|Literature Review|Online Appendix|Internet Appendix|Appendices|Contents|Figures|Tables|Appendix Figures|Appendix Tables)[ \t]*$/) {
        emit("unnumbered", "-", t)
        next
      }
    }
  ' "$f" >> "$OUT"

done < <(find "$CACHE_DIR/layout" -name 'page_*.txt' -print0 | sort -zV)

# Dedupe body headers by label, keeping the LOWEST page number. Sections appear
# in document order, so a label's first appearance is its real header; later
# matches on the same label are running heads or table noise. Contents-page
# entries were already diverted to kind=toc by the pre-pass above, so they no
# longer compete. (Keeping the highest page instead lost a genuine
# "1  Introduction" on p.3 to a stray "4  B" table cell on p.89.)
{
  head -1 "$OUT"
  tail -n +2 "$OUT" | awk -F'\t' '
    $2 == "toc" { toc[++nt] = $0; next }
    { if (!($3 SUBSEP $2 in best) || $1 + 0 < page[$3 SUBSEP $2]) {
        best[$3 SUBSEP $2] = $0; page[$3 SUBSEP $2] = $1 + 0
        if (!($3 SUBSEP $2 in seen)) { order[++nb] = $3 SUBSEP $2; seen[$3 SUBSEP $2] = 1 }
      } }
    END {
      for (i = 1; i <= nb; i++) print best[order[i]]
      for (i = 1; i <= nt; i++) print toc[i]
    }' | sort -t$'\t' -k1,1n -k3,3
} > "$OUT.tmp" && mv "$OUT.tmp" "$OUT"

n=$(( $(wc -l < "$OUT") - 1 ))
nbody=$(tail -n +2 "$OUT" | awk -F'\t' '$2 != "toc"' | wc -l | tr -d ' ')
echo "extract_headers.sh: $n header lines ($nbody body, $((n - nbody)) contents-page) -> $OUT" >&2

if [[ "$TO_STDOUT" == true ]]; then
  cat "$OUT"
fi

exit 0
