(define (square x) (* x x))
(define (cube x) (* x x x))

(define (good-enough? guess x)
  (< (abs (- (cube guess) x)) (/ x 10000000)))

(define (cbrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (cbrt-iter (improve guess x)
		 x)))

(define (improve guess x)
  (better-approximation (* 2 guess) (/ x (square guess))))

(define (better-approximation x y)
  (/ (+ x y) 3))

(define (cbrt x)
  (cbrt-iter 1.0 x))

(print (cbrt 27))
(print (cbrt 729))
(print (cbrt 1))
