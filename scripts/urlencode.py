#!/usr/bin/python

import sys
import urllib

if len(sys.argv) == 3:
    query = {sys.argv[1]: sys.argv[2]}
    print urllib.urlencode(query)

elif len(sys.argv) == 2:
    print urllib.quote_plus(sys.argv[1])
