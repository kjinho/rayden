(defsystem "rayden"
  :version "0.1.0"
  :author "Jin-Ho King"
  :license "MIT License"
  :depends-on (:alexandria ;; public domain
               :arrow-macros) ;; MIT License
  :components ((:module "src"
                :components
                ((:file "main"))))
  :description "Utilities for writing Common Lisp programs"
  :in-order-to ((test-op (test-op "rayden/tests"))))

(defsystem "rayden/tests"
  :author "Jin-Ho King"
  :license "MIT License"
  :depends-on ("rayden"
               "rove") ;; BSD-3-Clause License
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for rayden"
  :perform (test-op (op c) (symbol-call :rove :run c)))
