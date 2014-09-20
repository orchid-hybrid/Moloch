#lang racket

(require "parser/parser.rkt")
(require "syntactic-closures-macro-system/syntactic-closures.rkt")
(require "syntactic-closures-macro-system/define-syntax.rkt")
(require "cps-transform/cps.rkt")

(define (initialize)
  (displayln "reading macro file")
  (let ((macros (scm-parse-file "prelude/macros.rkt")))
    (compile*** scheme-macro-environment `(begin . ,macros))
    (displayln "Done")))

(define (scrum file)
  (displayln "reading input file")
  (let ((input (scm-parse-file file)))
    (for-each pretty-print input)
    (displayln "macro expanding")
    (let ((expanded-form (compile*** scheme-macro-environment `(begin . ,input))))
      (pretty-print expanded-form)
      (displayln "CPS transforming")
      (let ((cps-form (cps-transform expanded-form)))
        (pretty-print cps-form)
        (displayln "Done")))))

(initialize)
