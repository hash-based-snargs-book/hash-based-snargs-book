.PHONY: all clean check-tex-version

all: check-tex-version snargs-book.pdf

check-tex-version:
	@echo "Checking TeX distribution version..."
	@lualatex --version | grep '2024' > /dev/null || (echo "ERROR: TeX distribution is not from 2024. Please update your TeX distribution." && false)

snargs-book.pdf: clean snargs-book.tex
	latexmk -pdf -pdflatex="lualatex -interaction=nonstopmode -file-line-error -recorder" -use-make snargs-book.tex

clean:
	latexmk -CA
