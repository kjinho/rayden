(defpackage rayden
  (:use :cl)
  (:import-from :alexandria :iota)
  (:import-from :arrow-macros :-> :->> :as->)
  (:export
   :drop
   :take
   :iota
   :->
   :->>
   :as->
   :len=1))
(in-package :rayden)

;; blah blah blah.


(declaim
 (ftype (function (fixnum sequence) list) take))
(defun take (n seq)
  "Returns a new list of the first n items of seq.
If n is zero or negative, returns nil."
  (ctypecase seq
    (list
     (if (< n 1)
         nil
         (loop for i upto (1- n)
               for item in seq
               collect item)))
    (vector
     (if (< n 1)
         nil
         (loop for i upto (1- n)
               for item across seq
               collect item)))))

(declaim
 (ftype (function (fixnum list) list) drop))
(defun drop (n list)
  "Returns the list with the first n-items dropped from the front of
the list. Although this does not change the original list, drop does
not create a new list. If n is zero or negative, drop returns the
original list."
  (if (or (< n 1)
          (null list))
      list
      (drop (1- n) (cdr list))))

(declaim
 (ftype (function (sequence) boolean) len=1))
(defun len=1 (seq)
  (ctypecase seq
    (list
     (and (not (null seq))
          (null (cdr seq))))
    (vector
     (= 1 (length seq)))))
