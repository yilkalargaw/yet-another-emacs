;;; objed-goto-next-specialized.el --- Personal modifications to objed-mode objed-next method.
;; Copyright 2019 yilkalargaw

;; Author: yilkalargaw <yilkalargawworkneh@gmail.com>
;; Maintainer: yilkalargaw <yilkalargawworkneh@gmail.com>
;; Keywords: objed objed-modification
;; URL: https://github.com/yilkalargaw/objed-goto-next-specialized
;; Created: 27-11-2019
;; Version: 0.0.1
;; Package-Requires:

;;; Commentary:
;;
  ;; Modify objed to add objed-goto-next-specialized

;;; Code:



(require 'objed)
(require 'expand-region)

(defun objed--goto-next-specialized (&optional arg)
  "Move to the next object.

With postitive prefix argument ARG move to the nth next object."
  (let ((arg (or arg 1))
        (obj nil))
      (if (equal objed--object 'line)
	  (objed-next-line)
    	(progn
	  (dotimes (_ arg obj)
	    (when (setq obj  (objed--get-next))
	      (objed--update-current-object obj)
	      (cond ((or (equal objed--object 'word)
			 (equal objed--object 'sexp))
		     (goto-char (objed--end obj)))
		    (t (objed--goto-char (objed--beg obj))))))))))

(defun objed-next-specialized (&optional arg)
  "Move to ARG next object of current type."
  (interactive "p")
  ;; on init skip current
  (when (and (region-active-p)
             (eq last-command 'objed-extend))
    (exchange-point-and-mark))
  (let ((pos (point)))
    (objed--goto-next-specialized (or arg 1))
    (when (eq pos (point))
      (error "No next %s" objed--object))))


(defun objed--goto-previous-specialized (&optional arg)
  "Move to the previous object.

With postitive prefix argument ARG move to the nth previous object."
  (let ((arg (or arg 1))
        (obj nil))
          (if (equal objed--object 'line)
	      (objed-previous-line)
	    (progn
	      (dotimes (_ arg obj)
		(when (setq obj (objed--get-prev))
		  (objed--update-current-object obj)
		  (objed--goto-char (objed--beg obj))))))))

(defun objed-previous-specialized (&optional arg)
  "Move to ARG previous object of current type."
  (interactive "p")
  ;; on init skip current
  (when (and (region-active-p)
             (eq last-command 'objed-extend))
    (exchange-point-and-mark))
  (let ((pos (point)))
    (objed--goto-previous-specialized (or arg 1))
    (when (eq pos (point))
      (error "No next %s" objed--object))))



(defun objed--find-next-non-comment-or-non-whitespace ()
  ;; (skip-chars-forward " \n\t\r\v\f")
  (search-forward-regexp "[^\s]")
  (if (or (nth 4 (syntax-ppss)) (member (char-after (point)) '(9 10 11 12 13 32)))
      (objed--find-next-non-comment-or-non-whitespace)
    (point)
    ))


(objed-define-object nil defun
  :get-obj
  (objed-bounds-from-region-cmd #'er/mark-defun)
  :try-next
  (end-of-defun 1)
  :try-prev
  (beginning-of-defun 1))


(objed-define-object python defun
  :mode python-mode
  :no-skip t
  :get-obj
  (objed-bounds-from-region-cmd #'er/mark-defun)
  :try-next
  (progn
    (end-of-defun)
    )
  :try-prev
  (beginning-of-defun 1))

(provide 'objed-goto-next-specialized)
;;; objed-goto-next-specialized ends here
