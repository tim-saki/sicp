(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
	(else else-clause)))

(define (square x) (* x x))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
	  guess
	  (sqrt-iter (improve guess x)
		     x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(print (sqrt 9))
;; (print (sqrt (+ 100 37)))
;; (print (sqrt (+ (sqrt 2) (sqrt 3))))
;; (print (square (sqrt 10000)))

;; Q. What happens when Alyssa attempts to use this to compute square roots?
;; A. infinite loop has come. in case of "if", predicate expression is evaluated first and "good-enough?" works. in case of "new-if", infinite expansion occurs.
;; (sqrt 9)
;; v
;; (sqrt-iter 1.0 9)
;; v
;; (new-if (good-enough? 1.0 9)
;; 	1.0
;; 	(sqrt-iter (improve 1.0 9)
;; 		   9))
;; v
;; (cond ((good-enough? 1.0 9) 1.0)
;;       (else (sqrt-iter (improve 1.0 9) 9)))
;; v
;; (cond ((good-enough? 1.0 9) 1.0)
;;       (else
;;        (new-if (good-enough? 1.0 9)
;; 	       1.0
;; 	       (sqrt-iter (improve 1.0 9)
;; 			  9))
;;        ))
;; v
;; (cond ((good-enough? 1.0 9) 1.0)
;;       (else
;;        (cond ((good-enough? 1.0 9) 1.0)
;; 	     (else (sqrt-iter (improve 1.0 9) 9)))
;;        ))
;; v
;; sqrt-iter, sqrt-iter, sqrt-iter...
