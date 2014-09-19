(define-syntax quasiquote
  (lambda (syntactic-env exp)
    (let ((body (cadr exp)))
      (if (or (null? body) (symbol? body))
          (make-syntactic-closure scheme-macro-environment '()
                                  (cons 'quote (cons body '())))
          (if (pair? body)
              (if (eq? (car body) 'unquote)
                  (make-syntactic-closure scheme-macro-environment '()
                                          (cadr body))
                  (make-syntactic-closure scheme-macro-environment '()
                                          (cons 'cons (cons (cons 'quasiquote (cons (car body) '()))
                                                            (cons (cons 'quasiquote (cons (cdr body) '()))
                                                                                 '())))))
              (error body))))))

(define-syntax let
  (lambda (syntactic-env exp)
    ;; (let ((<param> <arg>) ...) <body> ...)
    (let ((bindings (cadr exp))
          (body (cddr exp)))
      (let ((params (map car bindings))
            (args (map cadr bindings)))
        (make-syntactic-closure scheme-macro-environment '()
          `((lambda ,params . ,body) ,args))))))
