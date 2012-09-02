# Pretty trivial Makefile, really here to document that there's nothing complicated to do to build the document

VOUnits.pdf: VOUnits.tex unity-grammars known-units.tex
	pdflatex VOUnits

VOUnits.bbl: VOUnits.aux
	bibtex VOUnits

unity-grammars: unity-grammars.tar.gz
	if test -d unity-grammars; then rm -Rf unity-grammars; else :; fi
	tar xzf unity-grammars.tar.gz

clean:
	for e in log toc aux bbl blg out pdf; do rm -f VOUnits.$$e; done
	rm -Rf unity-grammars

# # Retrieve known-units file from Unity library
# # (amend this as appropriate to change tag or changeset identifier).
# # Although this indicates how to retrieve the known-units.csv file, we
# # have checked in this file in order to make this source set self-contained.
# known-units.csv:
# 	curl -O https://bitbucket.org/nxg/unity/raw/v0.6/src/grammar/known-units.csv

known-units.tex: unity-grammars known-units-to-tex.awk
	rm -f $@
	tr -d '\r' <unity-grammars/known-units.csv | grep -v '^"*#' | sort | awk -F, -f known-units-to-tex.awk >$@
