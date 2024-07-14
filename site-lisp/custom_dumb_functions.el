;;; custom_dumb_functions.el --- Implement something like vim's F command.
;; Copyright 2019 yilkalargaw

;; Author: yilkalargaw <yilkalargawworkneh@gmail.com>
;; Maintainer: yilkalargaw <yilkalargawworkneh@gmail.com>
;; Keywords: simple custom dumb
;; URL:
;; Created: 27-11-2019
;; Version: 0.0.1
;; Package-Requires:

;;; Commentary:
;;
;; simple dumb functions I use

;;; Code:

(defun my-open-toipe ()
  "Open toipe using term."
  (interactive)
  (ansi-term "toipe"))

(defun my-open-nnn ()
  "Open toipe using term."
  (interactive)
  (ansi-term "nnn"))

(provide 'custom_dumb_functions)
;;; custom_dumb_functions.el ends here
