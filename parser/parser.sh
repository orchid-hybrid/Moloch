#!/bin/sh
racket -e "(require \"parser.scm\") (for-each pretty-print* (scm-parse-file \"$1\"))" > $1.1.out
racket -e "(require \"parser.scm\") (for-each pretty-print* (scm-parse-file \"$1.1.out\"))" > $1.2.out
diff $1.1.out $1.2.out
