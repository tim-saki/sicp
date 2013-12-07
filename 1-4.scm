(define (a-plus_abs_b a b)
  ((if (> b 0) + -) a b))
(print (a-plus_abs_b 2 3))
(print (a-plus_abs_b 2 -3))
