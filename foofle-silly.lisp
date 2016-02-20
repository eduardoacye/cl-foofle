;; -*- mode: lisp; coding: utf-8 -*-

;; 2016 - Eduardo Acuña Yeomans

;; foofle-silly.lisp

(in-package #:silly)

(defparameter *graph*
  '((:a 666     :b :e)
    (:b 99      :a :d :f)
    (:c 69      :c :e)
    (:d 0       :b :f)
    (:e michael :a :x :y :z)
    (:f jackson :a :b :c :e)))

(defparameter *visited-documents* 9)
(defparameter *visited-relations* nil)
(defparameter *collected-values* nil)

(defun init ()
  '(:a))

(defun in-document (doc)
  (let ((content (assoc doc *graph*)))
    (when content
      (let ((value     (cadr content))
            (relatives (cddr content)))
        (pushnew doc *visited-documents*)
        (push value *collected-values*)
        (remove-if (lambda (rel) (member (cons doc rel) *visited-relations* :test #'equal))
                   relatives)))))

(defun in-relation (doc rel)
  (pushnew (cons doc rel) *visited-relations* :test #'equal)
  (not (member rel *visited-documents*)))

(defun crawl-silly ()
  (crawl :init #'init
         :in-document #'in-document
         :in-relation #'in-relation
         :depth 10))

(defun crawl-silly-verbose ()
  (crawl-verbose :init #'init
                 :in-document #'in-document
                 :in-relation #'in-relation
                 :depth 10))


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
