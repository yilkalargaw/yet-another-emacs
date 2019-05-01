;;; package --- Summary
;;; Commentary:
;;; Code:

;;(package-initialize)

(require 'package)

;; If you want  to use the latest version
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
;; If you want to use the last tagged version
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))

;;(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))

(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'init)
