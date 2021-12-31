(defpackage rayden
  (:use :cl)
  (:import-from :alexandria :iota :curry)
  (:import-from :arrow-macros :-> :->> :as->)
  (:export
   :drop
   :take
   :iota
   :curry
   :->
   :->>
   :as->
   :len=1
   :length=1
   :string-split))
(in-package :rayden)


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
 (ftype (function (list) boolean) len=1))
(defun len=1 (lst)
  "Checks if the length of the list is one"
  (and (not (null lst))
       (null (cdr lst))))

(declaim
 (ftype (function (sequence) boolean) length=1))
(defun length=1 (seq)
  "Checks if the length of the sequence is one"
  (ctypecase seq
    (list
     (and (not (null seq))
          (null (cdr seq))))
    (vector
     (= 1 (length seq)))))

(declaim
 (ftype (function (string string &optional boolean) list) string-split))
(defun string-split (substr mainstr &optional (remove-empty? t))
  "Returns a list of strings that constitute mainstr split
wherever substr occurs"
  (when (string= "" substr)
    (error "~S is an invalid substring to split over" substr))
  (loop with l = (length substr)
        for i = 0 then (+ j l)
        as j = (search substr mainstr :start2 i)
        for found-substr = (subseq mainstr i j)
        when (or (string/= "" found-substr)
                 (not remove-empty?))
          collect (subseq mainstr i j)
        while j))
