;; -*- mode: lisp; coding: utf-8 -*-

;; 2016 - Eduardo Acuña Yeomans

;; cl-foofle.lisp

(in-package #:cl-foofle)

(defun crawl (&key (init nilfun) (in-document nilfun) (in-relation nilfun) (depth 1))
  (let ((current-docs (funcall init))
        (pending-docs nil))
    (dotimes (level depth)
      (dolist (doc current-docs)
        (dolist (rel (funcall in-document doc))
          (when (funcall in-relation doc rel)
            (pushnew rel pending-docs))))
      (when (not current-docs)
        (return nil))
      (setf current-docs pending-docs)
      (setf pending-docs nil))))

(defun crawl-verbose (&key (init nilfun) (in-document nilfun) (in-relation nilfun) (depth 1))
  (let ((current-docs (funcall init))
        (pending-docs nil)
        (ndocuments   0)
        (nrelations   0))
    (dotimes (level depth)
      (format t "~%[CRAWLING] at level ~a/~a documents ~a~%" level depth current-docs)
      (dolist (doc current-docs)
        (format t "[CRAWLING] processing ~a~%" doc)
        (incf ndocuments)
        (let ((relatives (funcall in-document doc)))
          (format t "[CRAWLING] processing ~a -> ~a~%" doc relatives)
          (dolist (rel relatives)
            (incf nrelations)
            (when (funcall in-relation doc rel)
              (format t "[CRAWLING] pending relative ~a~%" rel)
              (pushnew rel pending-docs)))))
      (when (or (not current-docs) (= (1+ level) depth))
        (format t "~%[CRAWLING] done crawling:~%~10t|documents|=~a~%~10t|relations|=~a~%"
                ndocuments nrelations)
        (return nil))
      (setf current-docs pending-docs)
      (setf pending-docs nil))))
