;; -*- mode: lisp; coding: utf-8 -*-

;; 2016 - Eduardo Acuña Yeomans

;; cl-foofle.asd

(asdf:defsystem #:cl-foofle
  :description "Biblioteca para crear motores de búsqueda"
  :author "Eduardo Acuña Yeomans <eduardo.acye@gmail.com>"
  :license "GPLv3"
  :depends-on (#:drakma
               #:cl-html-parse)
  :components ((:file "packages")
               (:file "specials"           :depends-on ("packages"))
               (:file "utility"            :depends-on ("packages"))
               (:file "macros"             :depends-on ("packages"))
               (:file "cl-foofle"          :depends-on ("macros" "utility" "specials"))
               (:file "foofle-silly"       :depends-on ("cl-foofle"))
               (:file "foofle-unison"      :depends-on ("cl-foofle"))))
