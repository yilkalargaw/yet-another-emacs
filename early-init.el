;;; early-init.el --- Early initialization. -*- lexical-binding: t -*-

;;; Commentary:
;;
;; Emacs HEAD (27+) introduces early-init.el, which is run before init.el,
;; before package and UI initialization happens.
;;

;;; Code:

;; Defer garbage collection further back in the startup process
;; (setq gc-cons-threshold (if (display-graphic-p) 400000000 100000000))
(setq gc-cons-threshold (if (display-graphic-p) (* 400 1024 1024 ) (* 128 1024 1024)))


;; Faster to disable these here (before they've been initialized)
;; (unless (and (display-graphic-p) (eq system-type 'darwin))
;;   (push '(menu-bar-lines . 0) default-frame-alist))
;; (unless (and (display-graphic-p) (eq system-type 'darwin))
;;   (push '(menu-bar-lines . 0) initial-frame-alist))
;; (push '(tool-bar-lines . 0) default-frame-alist)
;; (push '(tool-bar-lines . 0) initial-frame-alist)
;; (push '(vertical-scroll-bars) default-frame-alist)
;; (push '(vertical-scroll-bars) initial-frame-alist)
;; (push '(tool-bar-lines . 0) default-frame-alist)
;; (push '(tool-bar-lines . 0) initial-frame-alist)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; (setq package-list
;;       '(use-package))

(add-hook 'after-make-frame-functions
          (lambda (frame)
            (select-frame frame)
            (if (display-graphic-p)
                (progn
                  ;; (set-frame-size frame 93 50)
                  ;; (set-frame-position frame 0 15)
                  ;; (set-window-margins nil 2)
                  (scroll-bar-mode -1)
		  (menu-bar-mode -1)
		  (tool-bar-mode -1)
                  ))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; early-init.el ends here
