# Pretty trivial Makefile, really here to document that there's
# nothing complicated to do to build the document. 

VOUnits.pdf: VOUnits.tex unity-grammars known-units.tex
	pdflatex VOUnits

VOUnits.bbl: VOUnits.aux
	bibtex VOUnits

unity-grammars: unity-grammars.zip
	if test -d unity-grammars; then rm -Rf unity-grammars; else :; fi
	unzip unity-grammars.zip
	touch unity-grammars

# The file known-units.tex is generated but checked in, so that the
# document is buildable on a machine without 'make' or 'awk'.
known-units.tex: unity-grammars known-units-to-tex.awk
	rm -f $@
	echo '\\iffalse\n% Generated from unity-grammars.zip/known-units.csv\n%' >$@
	sed 's/^/% /' unity-grammars/README >>$@
	echo '\\fi' >>$@
	tr -d '\r' <unity-grammars/known-units.csv | grep -v '^"*#' | awk -F, -f known-units-to-tex.awk | sort -f >>$@

clean:
	for e in log toc aux bbl blg out pdf; do rm -f VOUnits.$$e; done
	rm -Rf known-units.tex unity-grammars
