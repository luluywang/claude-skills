#!/bin/bash
# split_pdf.sh
#
# Usage: ./split_pdf.sh input.pdf
#
# This script splits the given PDF at the first occurrence of any of the
# following strings and outputs files with names defined by parallel arrays.
#
# In this script the keywords and output filenames are defined as:
#
#
#
# Requirements:
#   - pdftotext (from poppler)
#   - pdftk (for splitting the PDF)
#
# This script avoids associative arrays for compatibility with older Bash versions.

# Define the keywords to search for.
keywords=("Kilts" "A-1" "E-1" "R1-1" "R2-1" "R3-1")

# Define the corresponding output filenames (without the .pdf extension).
output_names=("payment_jmp" "online_appendix" "editor_response" "referee_1" "referee_2" "referee_3")

# Check that exactly one argument was provided.
if [ $# -ne 1 ]; then
    echo "Usage: $0 input.pdf"
    exit 1
fi

pdf="$1"
if [ ! -f "$pdf" ]; then
    echo "Error: File '$pdf' not found."
    exit 1
fi

# Create a temporary file for the extracted text.
tmpfile=$(mktemp /tmp/pdftext.XXXXXX.txt)

# Use pdftotext with -layout to extract text from the PDF.
pdftotext -layout "$pdf" "$tmpfile"

# Append a form-feed character to ensure the last page is properly terminated.
echo -e "\f" >> "$tmpfile"

# Read the text file into an array, splitting on the form-feed character.
IFS=$'\f' read -d '' -ra pages < "$tmpfile"

# Remove the temporary text file.
rm "$tmpfile"

# Remove any empty element at the end (which may result from the appended form-feed).
num_pages_text=${#pages[@]}
if [ -z "${pages[$((num_pages_text-1))]// }" ]; then
    unset pages[$((num_pages_text-1))]
fi
pages=("${pages[@]}")  # Re-index the array

# Determine the total number of pages in the PDF using pdftk.
pdftk_total=$(pdftk "$pdf" dump_data | grep NumberOfPages | awk '{print $2}')
echo "Total pages in PDF (according to pdftk): $pdftk_total"

# Arrays to store the detected split page numbers (1-indexed, based on pdftotext) and their corresponding markers.
declare -a split_pages
declare -a split_markers

# Loop over each page (from pdftotext) and search for each keyword.
for ((i=0; i<${#pages[@]}; i++)); do
    page_content="${pages[i]}"
    for keyword in "${keywords[@]}"; do
        if [[ "$page_content" == *"$keyword"* ]]; then
            # Only record the first occurrence of this keyword.
            found=false
            for marker in "${split_markers[@]}"; do
                if [ "$marker" = "$keyword" ]; then
                    found=true
                    break
                fi
            done
            if [ "$found" = false ]; then
                # Record the page number (1-indexed) and the marker.
                split_pages+=("$((i+1))")
                split_markers+=("$keyword")
                echo "Found '$keyword' on page $((i+1))"
            fi
        fi
    done
done

# If no markers were found, exit.
if [ ${#split_pages[@]} -eq 0 ]; then
    echo "No split markers found in '$pdf'."
    exit 0
fi

# Append a final boundary equal to pdftk_total+1 so that the last section goes to the end.
split_pages+=("$((pdftk_total + 1))")

# Loop through each marker and extract the corresponding page range.
num_markers=${#split_markers[@]}
for ((i=0; i<num_markers; i++)); do
    start=${split_pages[i]}
    end=$((${split_pages[i+1]} - 1))
    # Ensure that the end page does not exceed the total page count.
    if [ "$end" -gt "$pdftk_total" ]; then
        end="$pdftk_total"
    fi
    marker="${split_markers[i]}"
    # Trim any leading/trailing whitespace.
    marker="$(echo "$marker" | xargs)"
    output_name=""
    # Look up the desired output filename by matching the marker with our keywords.
    for j in "${!keywords[@]}"; do
        if [ "$marker" = "${keywords[j]}" ]; then
            output_name="${output_names[j]}"
            break
        fi
    done
    # If no mapping is found, use a sanitized version of the marker.
    if [ -z "$output_name" ]; then
        output_name=$(echo "$marker" | tr ' ' '_' | tr -cd '[:alnum:]_')
    fi
    output="${output_name}.pdf"
    echo "Extracting pages $start to $end into '$output'..."
    pdftk "$pdf" cat "${start}-${end}" output "$output"
done

echo "Splitting complete."
