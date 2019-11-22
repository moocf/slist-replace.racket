#lang racket

;; subst: Symbol x Symbol x SList -> SList
;; usage: (subst new old slist) = substitute symbol in a symbol list
(define subst
  (lambda (new old slist)
    (if (null? slist)
        '()
        (cons (subst-sexp new old (car slist))
              (subst new old (cdr slist))))))

(define subst-sexp
  (lambda (new old sexp)
    (if (not (list? sexp))
        (if (eqv? old sexp)
            new
            sexp)
        (subst new old sexp))))

; s-list ::= ({s-exp}*)
; s-exp  ::= symbol | s-list

; s-list ::= ()
;        ::= (s-exp . s-list)
; s-exp  ::= symbol | s-list

; (.) = cons operator
