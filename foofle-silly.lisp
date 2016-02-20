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
