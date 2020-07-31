;;; move-to-char.el --- Implement something like vim's F command.
;; Copyright 2019 yilkalargaw

;; Author: yilkalargaw <yilkalargawworkneh@gmail.com>
;; Maintainer: yilkalargaw <yilkalargawworkneh@gmail.com>
;; Keywords: vimf move-to-char move-upto-char
;; URL: https://github.com/yilkalargaw/move-to-char
;; Created: 27-11-2019
;; Version: 0.0.1
;; Package-Requires:

;;; Commentary:
;;
;; Implement something like vim's F command

;;; Code:

(defun move-to-char (arg char)
  "Move to the ARGth occurrence of CHAR.
Case is ignored if `case-fold-search' is non-nil in the current buffer.
Goes backward if ARG is negative; error if CHAR not found."
  (interactive (list (prefix-numeric-value current-prefix-arg)
		     (read-char "move-to-char: " t)))
  ;; Avoid "obsolete" warnings for translation-table-for-input.
  (with-no-warnings
    (if (char-table-p translation-table-for-input)
	(setq char (or (aref translation-table-for-input char) char))))
  (search-forward (char-to-string char) nil nil arg))

(defun move-upto-char (arg char)
  "Move up to the ARGth occurrence of CHAR.
Case is ignored if `case-fold-search' is non-nil in the current buffer.
Goes backward if ARG is negative; error if CHAR not found."
  (interactive (list (prefix-numeric-value current-prefix-arg)
		     (read-char "move-upto-char: " t)))

  (let ((direction (if (>= arg 0) 1 -1)))
    ;; Avoid "obsolete" warnings for translation-table-for-input.
    (with-no-warnings
      (if (char-table-p translation-table-for-input)
	  (setq char (or (aref translation-table-for-input char) char))))
    (forward-char direction)
    (unwind-protect
	(search-forward (char-to-string char) nil nil arg)
      (backward-char direction))))

(defun move-back-upto-char (arg char)
  "Move back to the ARGth occurrence of CHAR.
Case is ignored if `case-fold-search' is non-nil in the current buffer.
Goes forward if ARG is negative; error if CHAR not found."
  (interactive (list (prefix-numeric-value current-prefix-arg)
		     (read-char "move-back-upto-char: " t)))
  (let ((narg (- 0 arg)))
    ;; Avoid "obsolete" warnings for translation-table-for-input.
    (with-no-warnings
      (if (char-table-p translation-table-for-input)
	  (setq char (or (aref translation-table-for-input char) char))))
    (search-forward (char-to-string char) nil nil narg)))

(defun move-back-to-char (arg char)
  "Move back up to the ARGth occurrence of CHAR.
Case is ignored if `case-fold-search' is non-nil in the current buffer.
Goes forward if ARG is negative; error if CHAR not found."
  (interactive (list (prefix-numeric-value current-prefix-arg)
		     (read-char "move-back-to-char: " t)))

  (let ((direction (if (>= arg 0) 1 -1))
	(narg (- 0 arg)))
    ;; Avoid "obsolete" warnings for translation-table-for-input.
    (with-no-warnings
      (if (char-table-p translation-table-for-input)
	  (setq char (or (aref translation-table-for-input char) char))))
    (forward-char direction)
    (unwind-protect
	(search-forward (char-to-string char) nil nil narg)
      (backward-char direction))))

(provide 'move-to-char)
