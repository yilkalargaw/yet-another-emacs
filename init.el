;;; package --- Summary
;;; Commentary:
;;; Code:

;;(package-initialize)

(setq vc-follow-symlinks t)

(org-babel-load-file
 (expand-file-name
  "myinit.org"
  user-emacs-directory))


(provide 'init)
;;; init.el ends here
