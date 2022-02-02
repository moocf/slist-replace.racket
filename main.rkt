#lang racket

;; slist.replace: Symbol x Symbol x SList -> SList
;; usage: (slist.replace new old slist) = substitute symbol in a symbol list
(define slist.replace
  (lambda (new old slist)
    (if (null? slist)
        '()
        (cons (slist.replace-sexp new old (car slist))
              (slist.replace new old (cdr slist))))))

(define slist.replace-sexp
  (lambda (new old sexp)
    (if (not (list? sexp))
        (if (eqv? old sexp)
            new
            sexp)
        (slist.replace new old sexp))))

; s-list ::= ({s-exp}*)
; s-exp  ::= symbol | s-list

; s-list ::= ()
;        ::= (s-exp . s-list)
; s-exp  ::= symbol | s-list

; (.) = cons operator
