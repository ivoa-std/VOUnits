# VOUnits

## Units in the VO

This document describes a recommended syntax for writing the string representation of unit labels ("VOUnits") in the VO landscape.

## Current Status

The current stable IVOA Recommendation is 
**[REC-VOUnits-1.1](https://ivoa.net/documents/VOUnits/20231215/)** 
(available from [IVOA Documents Repository](https://www.ivoa.net/documents)).

## Licence

<p><a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">
  <img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-sa/4.0/88x31.png" /></a>
  <br />
  This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">
  Creative Commons Attribution-ShareAlike 4.0 International License</a>.
</p>

## Building this document

To build this document, if you have 'make' and 'awk', simply give the command:

    % make VOUnits.pdf

This generates the file `known-units.tex` (derived from
`unity-grammars/known-units.csv`) and runs LaTeX on the document source.

The contents of the directory `unity-grammars`, containing the
machine-readable version of the list of known units, and the
yacc-style grammars, is derived from the Unity project; see
<https://purl.org/nxg/dist/unity> (which refers to the repository at
<https://heptapod.host/nxg/unity>).  You can obtain an updated copy of the
grammars from the Unity distribution, or by checking out the
repository, and building `src/grammar/unity-grammars.zip`.  In either
case, unzip the contents here and commit the update.

