(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

(test 0 (p)) ; not stop

;; Q. What behavior will Ben observe with an interpreter that uses applicative-order evaluation?
;; A. he ovserves infinite loop
;; (test 0 (p))
;; v (p) -> (p)
;; (test 0 (p))
;; v (p) -> (p)
;; (test 0 (p))

;; Q. What behavior will he observe with an interpreter that uses normal-order evaluation?
;; A. he ovserves 0
;; (test 0 (p))
;; v
;; (if (= 0 0)
;;     0
;;     (p))
;; v
;; (if true
;;     0
;;     (p))
;; v
;; 0
