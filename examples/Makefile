all: doc

doc:
	for datei in $$(ls *tex | cut -d \. -f 1) ; do make $$datei.pdf ; done

%.pdf: %.tex
	pdflatex --shell-escape $*.tex