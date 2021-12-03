(defpackage rayden/tests/main
  (:use :cl
        :rayden
        :rove))
(in-package :rayden/tests/main)

;; NOTE: To run this test file, execute `(asdf:test-system :rayden)' in your Lisp.

(deftest test-target-1
  (testing "should (= 1 1) to be true"
    (ok (= 1 1))))
