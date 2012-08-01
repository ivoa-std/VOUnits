# Pretty trivial Makefile, really here to document that there's nothing complicated to do to build the document

VOUnits.pdf: VOUnits.tex unity-grammars
	pdflatex VOUnits

VOUnits.bbl: VOUnits.aux
	bibtex VOUnits

unity-grammars: unity-grammars.tar.gz
	tar xzf unity-grammars.tar.gz

clean:
	for e in log toc aux bbl blg out pdf; do rm -f VOUnits.$$e; done
	rm -Rf unity-grammars
