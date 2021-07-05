#!/usr/bin/python3

import sys
import re

lines = []

for line in sys.stdin:
    if not re.search('#',line):
        lines.append(line.strip().split(','))

nrows = (len(lines)+1)//2

# The name-generating hack below doesn't work well in all cases,
# so supply some explicit replacements.
replacements = { 'unity:DetectorChannel': 'channel',
                 'qudt:DegreeAngle': 'degree (angle)',
                 'unity:DistributionBin': 'bin',
                 'qudt:Gram': 'gramme',
                 'unity:MilliArcSecond': 'milliarcsecond',
                 'qudt:MinuteTime': 'minute (time)',
                 'qudt:SecondTime': 'second (time)',
                 'unity:SolarLuminosity': 'luminosity',
                 'unity:StellarMagnitude': 'magnitudes',
                 'qudt:UnifiedAtomicMassUnit': 'AMU',
                 }

all_uppercase = re.compile('^[A-Z]+$')
initial_capital = re.compile('[A-Z][^A-Z]*')

def fmtname(uname):
    if uname in replacements:
        rval = replacements[uname]
    else:
        nameparts = uname.split(':')
        if len(nameparts) != 2:
            print("name {} malformed".format(uname), file=sys.stderr)
            rval ='XXX'
        else:
            tname = nameparts[1]
            if all_uppercase.match(tname):
                rval = tname
            elif initial_capital.match(tname):
                rval = " ".join(s.lower()
                	        for s in initial_capital.findall(tname))
            else:
                rval = tname
    return [rval]

def fmtrow(r):
    s = "&".join([r[0]] + fmtname(r[1]) + (["$\\cdot$" if s=="1" else s[1:] for s in r[2:]]))
    return s.replace("%", "\\%") # one of the units is '%' (ie, the TeX comment character)

for r in range(nrows):
    r2 = r+nrows
    if r2 >= len(lines):
        print("{}\\\\".format(fmtrow(lines[r])))
    else:
        print("{}\n\t& {}\\\\".format(fmtrow(lines[r]), fmtrow(lines[r2])))
