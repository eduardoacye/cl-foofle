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


;; LICENSE:
;;
;; cl-foofle: a common lisp search engine library
;; Copyright (C) 2016 Eduardo Acuña Yeomans
;;
;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.
