;;; early-init.el --- Early initialization. -*- lexical-binding: t -*-

;;; Commentary:
;;
;; Emacs HEAD (27+) introduces early-init.el, which is run before init.el,
;; before package and UI initialization happens.
;;

;;; Code:

;; Defer garbage collection further back in the startup process
(setq gc-cons-threshold (if (display-graphic-p) (* 400 1024 1024 ) (* 128 1024 1024)))

;; ;; Defer garbage collection further back in the startup process
;; (setq gc-cons-threshold most-positive-fixnum)

;; Inhibit resizing frame
(setq frame-inhibit-implied-resize nil)

(push '(vertical-scroll-bars . nil) default-frame-alist)
(push '(internal-border-width . 14) default-frame-alist)
(push '(left-fringe    . 4) default-frame-alist)
(push '(right-fringe   . 8) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)

;; Vertical window divider
(setq window-divider-default-right-width 14
      window-divider-default-places 'right-only)
(window-divider-mode 1)

;; ;; No ugly button for checkboxes
;; (setq widget-image-enable nil)


(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

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

;; ;; increase garbage collection threshold for startup only
;; ;; (setq gc-cons-threshold 8000000)
;; (setq gc-cons-threshold (if (display-graphic-p) (* 400 1024 1024 ) (* 128 1024 1024)))
;; (setq gc-cons-percentage 0.7))

(defvar yae-gc-cons-threshold (* 32 1024 1024))

(add-hook 'after-init-hook #'(lambda ()
                               ;; restore after startup
                               ;; (setq gc-cons-threshold 800000) ;; default
                               (setq gc-cons-threshold yae-gc-cons-threshold)
                               (setq gc-cons-percentage 0.5)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; early-init.el ends here
