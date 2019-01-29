all: obrazky main

main:
	pdflatex main.tex && bibtex main.aux && pdflatex main.tex && pdflatex main.tex

obrazky:
	cd obrazky; asy *.asy -f pdf; cd ..
