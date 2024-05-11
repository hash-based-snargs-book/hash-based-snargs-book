#!/bin/sh

# comment next line if want to skip the keynote to pdf conversion
(./key2pdf.sh)

d_array=(
"part-dependency-diagram"
"transformations-summary-diagram"
"roalgo-diagram"
"basic-commitment-diagram"
"iarg-diagram"
"narg-diagram"
"sp-diagram"
"ip-diagram"
"pcp-diagram"
"iop-diagram"
"warmup-fs-sp-diagram"
"fs-sp-diagram"
"slow-fs-ip-diagram"
"fast-fs-ip-diagram"
"kilian-diagram"
"micali-diagram"
"ibcs-diagram"
"bcs-diagram"
"tree-diagram"
"mt-diagram"
"mt-collision-lemma-diagram-1"
"mt-collision-lemma-diagram-2"
"mt-arbitrary-length"
"mt-prune-1"
"mt-prune-2"
"mt-prune-3"
"mt-prune-good-case"
"mt-prune-bad-case"
"inclusive-exclusive-diagram"
"fork-of-transcripts-diagram"
"tree-of-transcripts-diagram"
)

mkdir -p low-res

for i in ${!d_array[@]}; do
  pdftk diagrams.pdf cat $(($i+1)) output ${d_array[$i]}.pdf
  pdfcrop --margins '10 10 10 10' ${d_array[$i]}.pdf ${d_array[$i]}.pdf
  gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH -sOutputFile=low-res/${d_array[$i]}.pdf ${d_array[$i]}.pdf
  echo processed slide $(($i+1))
done
