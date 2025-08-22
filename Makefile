.PHONY: all clean check-tex-version

all: check-tex-version snargs-book.pdf

check-tex-version:
	@echo "Checking TeX distribution version..."
	@lualatex --version | grep -E '202[4-9]' > /dev/null || (echo "ERROR: TeX distribution is not from 2024 or later. Please update your TeX distribution." && false)

snargs-book.pdf: clean snargs-book.tex
	latexmk -pdf -pdflatex="lualatex -interaction=nonstopmode -file-line-error -recorder" -use-make snargs-book.tex

clean:
	latexmk -CA
