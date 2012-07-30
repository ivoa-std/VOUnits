# Pretty trivial Makefile, really here to document that there's nothing complicated to do to build the document

VOUnits.pdf: VOUnits.tex
	pdflatex VOUnits

VOUnits.bbl: VOUnits.aux
	bibtex VOUnits
