;; -*- mode: lisp; coding: utf-8 -*-

;; 2016 - Eduardo Acuña Yeomans

;; packages.lisp

(defpackage #:cl-foofle
  (:use #:cl)
  (:export crawl crawl-verbose))

(defpackage #:silly
  (:use #:cl #:cl-foofle))

(defpackage #:unison
  (:use #:cl #:cl-foofle))

