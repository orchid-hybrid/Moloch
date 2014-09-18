(define (collector)
  ;; collect elements into a list and ask for its value
  ;; 
  ;; (let ((c (collector)))
  ;;    (c 'a) (c 'b) (c))
  (let ((list '())
        (last-cell #f))
    (lambda args
      (if (null? args)
          list
          (if last-cell
              (begin
                (set-cdr! last-cell (cons (car args) '()))
                (set! last-cell (cdr last-cell)))
              (begin
                (set! list (cons (car args) '()))
                (set! last-cell list)))))))
