(define (square x) (* x x))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
		 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(print (sqrt 0.005))
(print (square 0.07224))
(print (sqrt 1000000000))
(print (square 31622))

(print "--")

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) (/ x 10000000)))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
		 x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(print (sqrt 0.005))
(print (square 0.070710))
(print (sqrt 1000000000))
(print (square 31622))
