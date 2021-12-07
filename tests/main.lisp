(defpackage rayden/tests/main
  (:use :cl
        :rayden
        :rove))
(in-package :rayden/tests/main)

;; NOTE: To run this test file, execute `(asdf:test-system :rayden)' in your Lisp.

(deftest test-drop
    (testing
     "drop function"
     (ok (equal (drop 10 '())
                '()))
     (ok (equal (drop 0 '())
                '()))
     (ok (equal (drop 0 '(1))
                '(1)))
     (ok (equal (drop 3 (iota 10))
                '(3 4 5 6 7 8 9)))
     (ok (equal (drop -2 (iota 10))
                (iota 10)))))

(deftest test-take
  (testing
   "take testing"
   (ok (equal (take 10 '())
              '()))
   (ok (equal (take 10 #())
              '()))
   (ok (equal (take 0 #())
              '()))
   (ok (equal (take 10 (iota 10))
              '(0 1 2 3 4 5 6 7 8 9)))
   (ok (equal (take 10 (apply #'vector (iota 10)))
              '(0 1 2 3 4 5 6 7 8 9)))
   (ok (equal (take 5 (iota 10))
              '(0 1 2 3 4)))
   (ok (equal (take 5 (apply #'vector (iota 10)))
              '(0 1 2 3 4)))
   (ok (equal (take -12 (iota 10))
              '()))
   (ok (equal (take -12 (apply #'vector (iota 10)))
              '()))
   (ok (equal (take 1 #*000)
              '(0)))
   (ok (equal (take 2 "str")
              '(#\s #\t)))))

(deftest test-length=1
  (testing
   "length=1 testing"
   (ok (length=1 '(test)))
   (ok (length=1 '(1)))
   (ng (length=1 nil))
   (ok (length=1 '(nil)))
   (ng (length=1 '(1 2 3)))
   (ok (length=1 #(1)))
   (ok (length=1 #(nil)))
   (ng (length=1 #(1 2)))
   (ng (length=1 #()))))
       
(deftest test-len=1
  (testing
   "len=1 testing"
   (ok (len=1 '(test)))
   (ok (len=1 '(1)))
   (ng (len=1 nil))
   (ng (len=1 (cons 1 2)))
   (ok (len=1 '(nil)))
   (ng (len=1 '(1 2 3)))))
   ;; (signal (length=1 #(1)))
   ;; (signal (length=1 #(nil)))
   ;; (signal (length=1 #(1 2)))
   ;; (signal (length=1 #()))))
