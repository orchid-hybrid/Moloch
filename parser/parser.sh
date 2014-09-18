#!/bin/sh
csi parser.scm -e "(map pretty-print (scm-parse-file \"$1\"))" > $1.1.out
csi parser.scm -e "(map pretty-print (scm-parse-file \"$1.1.out\"))" > $1.2.out
diff $1.1.out $1.2.out
