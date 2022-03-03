(define (split-at lst n)
  (cond ((= n 0) (cond ((null? lst) (cons lst nil))
                       (else (cons (car lst) (cdr lst)))))
        (else (cons (car lst) (split-at (cdr lst) (- n 1)))))
)

(define (compose-all funcs)
  (define (helper x) (23))
)
