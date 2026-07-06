#!/usr/bin/env bash
#
# Script: latex_to_word.sh
# Description: Flattens a multi-file LaTeX project (subfiles), cleans up
#              extra \begin{document}/\end{document}, converts natbib
#              citations to Pandoc format, and outputs a .docx.
#
# Requirements:
#   1) latexpand
#   2) pandoc
#   3) bash >= 4
#
# Usage:
#   ./latex_to_word.sh main.tex
#   (Bibliography files are auto-detected from \bibliography{} command)

set -e  # Exit on any error

# ----------------------------------------------------------------------------
# 1) Check input
# ----------------------------------------------------------------------------
if [ "$#" -lt 1 ]; then
  echo "Usage: $0 <main-tex-file> [optional .bib files...]"
  echo "  If no .bib files specified, they are auto-detected from \\bibliography{} command"
  exit 1
fi

BASEFILE="$1"
shift
if [ ! -f "$BASEFILE" ]; then
  echo "Error: '$BASEFILE' not found."
  exit 1
fi

# ----------------------------------------------------------------------------
# 1b) Auto-detect bibliography files if not provided
# ----------------------------------------------------------------------------
if [ "$#" -gt 0 ]; then
  BIBFILES=("$@")  # Use provided bib files
else
  echo "==> Auto-detecting bibliography files from $BASEFILE..."
  # Extract bibliography names from \bibliography{name1,name2,...} command (ignore commented lines)
  BIB_NAMES=$(grep -v '^[[:space:]]*%' "$BASEFILE" | grep -o '\\bibliography{[^}]*}' | sed 's/\\bibliography{//;s/}//' | tr ',' ' ')

  BIBFILES=()
  for name in $BIB_NAMES; do
    # Try parent directory first, then current directory
    if [ -f "../${name}.bib" ]; then
      BIBFILES+=("../${name}.bib")
      echo "    Found: ../${name}.bib"
    elif [ -f "${name}.bib" ]; then
      BIBFILES+=("${name}.bib")
      echo "    Found: ${name}.bib"
    else
      echo "    Warning: ${name}.bib not found"
    fi
  done

  if [ ${#BIBFILES[@]} -eq 0 ]; then
    echo "Warning: No bibliography files found. Citations may not be resolved."
  fi
fi

# ----------------------------------------------------------------------------
# 2) Prepare filenames
# ----------------------------------------------------------------------------
TMPFILE="tmp_main.tex"   
FLATFILE="flat_main.tex"
OUTDOCX="${BASEFILE%.tex}.docx"

# ----------------------------------------------------------------------------
# 3) Determine correct 'sed -i' usage for macOS vs. Linux
# ----------------------------------------------------------------------------
if [[ "$(uname)" == "Darwin" ]]; then
  SED_INPLACE=(-i '')
else
  SED_INPLACE=(-i)
fi

# ----------------------------------------------------------------------------
# 4) Copy main.tex to a temp file (so we don't modify the original)
# ----------------------------------------------------------------------------
echo "==> Copying '$BASEFILE' to '$TMPFILE'..."
cp "$BASEFILE" "$TMPFILE"

# ----------------------------------------------------------------------------
# 5) Flatten everything using latexpand
# ----------------------------------------------------------------------------
for i in {1..2}; do
  echo "==> Iteration $i: Replacing commands and running latexpand..."

  # Replace subfile and scalarinput with input
  sed "${SED_INPLACE[@]}" 's/\\subfile{/\\input{/g' "$TMPFILE"
  sed "${SED_INPLACE[@]}" 's/\\scalarinput{/\\input{..\/output\/tables\/scalars\//g' "$TMPFILE"

  # Inline \absinput{X}: read the scalar file and strip leading minus sign
  perl -i -pe 's/\\absinput\{([^}]+)\}/do {
    my $name = $1;
    my $f = "..\/output\/tables\/scalars\/$name";
    $f .= ".tex" unless $f =~ m\/\.tex$\/;
    open my $fh, "<", $f or warn "Cannot open $f: $!";
    my $v = $fh ? do { local $\/; <$fh> } : "";
    chomp $v;
    $v =~ s\/^-\/\/;
    $v;
  }/ge' "$TMPFILE"

  # Inline \scalarpctinput{X}: read the scalar file and strip leading "0."
  perl -i -pe 's/\\scalarpctinput\{([^}]+)\}/do {
    my $name = $1;
    my $f = "..\/output\/tables\/scalars\/$name";
    $f .= ".tex" unless $f =~ m\/\.tex$\/;
    open my $fh, "<", $f or warn "Cannot open $f: $!";
    my $v = $fh ? do { local $\/; <$fh> } : "";
    chomp $v;
    $v =~ s\/^0\.\/\/;
    $v;
  }/ge' "$TMPFILE"

  # Flatten the file using latexpand
  latexpand "$TMPFILE" > "$FLATFILE"

  # ----------------------------------------------------------------------------
  # 7) Remove subfiles boilerplate lines and simplify custom commands
  # ----------------------------------------------------------------------------
  echo "==> Removing \\documentclass[..]{subfiles} lines..."
  sed "${SED_INPLACE[@]}" '/\\documentclass\[.*\]{subfiles}/d' "$FLATFILE"

  # Remove custom caption commands that pandoc can't parse (they often span multiple lines)
  echo "==> Removing custom caption commands for pandoc..."
  # Use perl for multiline removal of \captionnotes{...}
  perl -i -0777 -pe 's/\\captionnotes\{[^{}]*(?:\{[^{}]*\}[^{}]*)*\}//gs' "$FLATFILE"
  sed "${SED_INPLACE[@]}" 's/\\tablenote{/\\textit{Notes: /g' "$FLATFILE"

  # ----------------------------------------------------------------------------
  # 8) Simplify complex table formatting for pandoc
  # ----------------------------------------------------------------------------
  echo "==> Simplifying table formatting for pandoc..."

  # Convert subtable to just the content (remove subtable wrapper)
  sed "${SED_INPLACE[@]}" 's/\\begin{subtable}\[.*\]{[^}]*}//' "$FLATFILE"
  sed "${SED_INPLACE[@]}" 's/\\end{subtable}//' "$FLATFILE"

  # Simplify complex column specs: >{\raggedright\arraybackslash}p{...} -> l
  # and >{\centering\arraybackslash}p{...} -> c
  sed "${SED_INPLACE[@]}" 's/>{\\raggedright\\arraybackslash}p{[^}]*}/l/g' "$FLATFILE"
  sed "${SED_INPLACE[@]}" 's/>{\\centering\\arraybackslash}p{[^}]*}/c/g' "$FLATFILE"
  sed "${SED_INPLACE[@]}" 's/>{\\raggedright}p{[^}]*}/l/g' "$FLATFILE"

  # Simplify multicolumn with complex specs
  sed "${SED_INPLACE[@]}" 's/\\multicolumn{2}{>{[^}]*}[^}]*}/\\multicolumn{2}{l}/g' "$FLATFILE"

  # Remove \cline commands (partial horizontal lines) - pandoc doesn't handle them well
  sed "${SED_INPLACE[@]}" '/\\cline{/d' "$FLATFILE"

  # Remove \small, \footnotesize inside tables
  sed "${SED_INPLACE[@]}" 's/\\small//g' "$FLATFILE"
  sed "${SED_INPLACE[@]}" 's/\\footnotesize//g' "$FLATFILE"

  # Remove \addlinespace
  sed "${SED_INPLACE[@]}" 's/\\addlinespace//g' "$FLATFILE"

  # Remove \sym{*} etc. and replace with just the symbol
  sed "${SED_INPLACE[@]}" 's/\\sym{\*\*\*}/***/g' "$FLATFILE"
  sed "${SED_INPLACE[@]}" 's/\\sym{\*\*}/**/g' "$FLATFILE"
  sed "${SED_INPLACE[@]}" 's/\\sym{\*}/*/g' "$FLATFILE"
  
  # ----------------------------------------------------------------------------
  # 9) Keep only the FIRST \begin{document}
  # ----------------------------------------------------------------------------
  echo "==> Keeping only the FIRST \\begin{document}, removing duplicates..."
  awk '
  BEGIN {
    found_begin = 0
  }
  {
    if ($0 ~ /\\begin{document}/) {
      if (found_begin == 0) {
        found_begin = 1
        print
      }
    } else {
      print
    }
  }
  ' "$FLATFILE" > "$FLATFILE.tmp"
  
  mv "$FLATFILE.tmp" "$FLATFILE"
  
  # ----------------------------------------------------------------------------
  # 10) Keep only the LAST \end{document}. latexpand ends at first \end{document}
  # ----------------------------------------------------------------------------
  echo "==> Keeping only the LAST \\end{document}, removing earlier ones..."
  awk '
  {
    lines[NR] = $0
    if ($0 ~ /\\end{document}/) {
      endDocs[++endCount] = NR
    }
  }
  END {
    lastLine = 0
    if (endCount > 0) {
      lastLine = endDocs[endCount]
    }
  
    for (i = 1; i <= NR; i++) {
      if ((lines[i] ~ /\\end{document}/) && (i < lastLine)) {
        # skip earlier \end{document}
        continue
      }
      print lines[i]
    }
  }
  ' "$FLATFILE" > "$FLATFILE.tmp"
  
  mv "$FLATFILE.tmp" "$FLATFILE"

  # Copy flattened file back to temporary file for next iteration
  cp "$FLATFILE" "$TMPFILE"
done



# ----------------------------------------------------------------------------
# 11) Convert PDF images to PNG (Word cannot render embedded PDFs)
# ----------------------------------------------------------------------------
echo "==> Converting PDF images to PNG for Word compatibility..."
IMGDIR="tmp_images"
mkdir -p "$IMGDIR"

# Find all \includegraphics references to .pdf files and convert them
# Use perl instead of grep -P for macOS compatibility
perl -ne 'while (/\\includegraphics(?:\[[^\]]*\])?\{([^}]*\.pdf)\}/g) { print "$1\n"; }' "$FLATFILE" | \
  sort -u | while read -r pdfpath; do
    if [ -f "$pdfpath" ]; then
      # Create a PNG version in tmp_images with a flat name
      pngname="$IMGDIR/$(echo "$pdfpath" | tr '/./' '__').png"
      echo "    Converting: $pdfpath -> $pngname"
      pdftoppm -png -r 300 -singlefile "$pdfpath" "${pngname%.png}"
      # Replace the .pdf path with the .png path in the flattened file
      escaped_pdf=$(printf '%s\n' "$pdfpath" | sed 's/[[\.*^$()+?{|]/\\&/g; s/\//\\\//g')
      escaped_png=$(printf '%s\n' "$pngname" | sed 's/[[\.*^$()+?{|]/\\&/g; s/\//\\\//g')
      sed "${SED_INPLACE[@]}" "s/${escaped_pdf}/${escaped_png}/g" "$FLATFILE"
    else
      echo "    Warning: PDF not found: $pdfpath"
    fi
  done

# Also handle .png images that use ../ paths — copy them locally if needed
perl -ne 'while (/\\includegraphics(?:\[[^\]]*\])?\{([^}]*\.png)\}/g) { print "$1\n"; }' "$FLATFILE" | \
  sort -u | while read -r pngpath; do
    # Skip files already in tmp_images
    case "$pngpath" in "$IMGDIR"/*) continue ;; esac
    if [ -f "$pngpath" ]; then
      pngname="$IMGDIR/$(basename "$pngpath")"
      cp "$pngpath" "$pngname"
      escaped_old=$(printf '%s\n' "$pngpath" | sed 's/[[\.*^$()+?{|]/\\&/g; s/\//\\\//g')
      escaped_new=$(printf '%s\n' "$pngname" | sed 's/[[\.*^$()+?{|]/\\&/g; s/\//\\\//g')
      sed "${SED_INPLACE[@]}" "s/${escaped_old}/${escaped_new}/g" "$FLATFILE"
    fi
  done

# ----------------------------------------------------------------------------
# 12) Convert flattened file to Word (.docx) using Pandoc
# ----------------------------------------------------------------------------
echo "==> Converting '$FLATFILE' => '$OUTDOCX' via Pandoc..."

# Build bibliography arguments for each bib file
BIB_ARGS=()
for bib in "${BIBFILES[@]}"; do
  BIB_ARGS+=("--bibliography=$bib")
done

pandoc "$FLATFILE" --citeproc "${BIB_ARGS[@]}" --from=latex --to=docx --output="$OUTDOCX"

echo ""
echo "======================================"
echo "Conversion complete!"
echo "Flattened file: $FLATFILE"
echo "Word document : $OUTDOCX"
echo "======================================"

rm -f $TMPFILE
rm -rf "$IMGDIR"
