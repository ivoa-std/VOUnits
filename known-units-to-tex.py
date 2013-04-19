#! /usr/bin/python

import sys
import string
import re

lines = []

for line in sys.stdin:
    if not re.search('#',line):
        lines.append(line.split(','))

nrows = (len(lines)+1)/2

def fmtrow(r):
    return string.join([r[0]] + (map(lambda s: "$\\cdot$" if s=="1" else s[1:], r[2:])),'&')

for r in range(nrows):
    r2 = r+nrows
    if r2 >= len(lines):
        print "%s\\\\" % (fmtrow(lines[r]))
    else:
        print "%s & %s\\\\" % (fmtrow(lines[r]), fmtrow(lines[r2]))
