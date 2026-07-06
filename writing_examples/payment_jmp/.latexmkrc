# Output auxiliary files to a separate directory to avoid Dropbox sync conflicts
$aux_dir = 'aux';
$out_dir = 'aux';

# Use pdflatex
$pdf_mode = 1;
$pdflatex = '/Library/TeX/texbin/pdflatex %O %S';

# %B already includes the aux/ prefix when $aux_dir is set, so no extra flags needed
$biber = '/Library/TeX/texbin/biber %O %B';