;;;; gio-example.asd

(asdf:defsystem :gio-example
  :author "Dieter Kaiser"
  :license "LLGPL"
  :serial t
  :depends-on (:cl-cffi-gtk)
  :components ((:file "gio-example")
               (:file "application-action")
               (:file "application-open")))

;;; 2020-12-9
