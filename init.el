;;; package --- Summary
;;; Commentary:
;;; Code:

;;(package-initialize)
(let ((file-name-handler-alist nil))
  (require 'package)


  (setq package-archives '( ;; ("marmalade" . "http://marmalade-repo.org/packages/")
			   ("org"       . "http://orgmode.org/elpa/")
			   ("gnu"       . "http://elpa.gnu.org/packages/")
			   ("melpa-stable" . "https://stable.melpa.org/packages/")
			   ("melpa"     . "http://melpa.org/packages/")))


					;increase garbage collection threshold for startup only
  (setq gc-cons-threshold 64000000)
  (add-hook 'after-init-hook #'(lambda ()
				 ;; restore after startup
				 (setq gc-cons-threshold 800000)))

  ;;Set custom settings to load in own file
  (setq custom-file (make-temp-file "emacs-custom"))


  ;; directories for custom themes and elsip-scripts
  (add-to-list 'load-path "~/.emacs.d/lisp")
  (add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

  ;;main setupfile loaded using org-bable
  (org-babel-load-file (expand-file-name "~/.emacs.d/myinit.org"))

(provide 'init))
;;; init.el ends here
