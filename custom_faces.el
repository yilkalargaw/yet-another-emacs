;; (setq warning-minimum-level :emergency)

;; (defcustom modified-org-beautify-theme-use-box-hack 't
;;   "Use a 3 pixel box with the background color to add spacing.
;;   Note that this has a side effect that can make the theme look
;;   really bad under some circumstances."
;;   :type 'boolean)

(let* (;; (base-font-color (face-foreground 'default  nil 'default))
       ;; (background-color (face-background 'default nil 'default))
       ;; (headline `(:inherit default :foreground ,base-font-color))
       ;; ;; (primary-color (face-foreground 'mode-line nil))
       ;; (secondary-color (face-background 'secondary-selection nil 'region))
       ;; (org-highlights `(:foreground ,base-font-color :background ,secondary-color))

       )

  (defun doomish-blend (color1 color2 alpha)
    "Blend two colors (hexidecimal strings) together by a coefficient ALPHA (a
float between 0 and 1)"
    (when (and color1 color2)
      (cond ((and color1 color2 (symbolp color1) (symbolp color2))
             (doom-blend (doom-color color1) (doom-color color2) alpha))

            ((or (listp color1) (listp color2))
             (cl-loop for x in color1
                      when (if (listp color2) (pop color2) color2)
                      collect (doom-blend x it alpha)))

            ((and (string-prefix-p "#" color1) (string-prefix-p "#" color2))
             (apply (lambda (r g b) (format "#%02x%02x%02x" (* r 255) (* g 255) (* b 255)))
                    (cl-loop for it    in (doom-name-to-rgb color1)
                             for other in (doom-name-to-rgb color2)
                             collect (+ (* alpha it) (* other (- 1 alpha))))))

            (color1))))


  (custom-set-faces

   ;; ;;;;; spacemacs-boldening
   ;; `(font-lock-function-name-face ((t (:inherit bold))))
   ;; `(font-lock-keyword-face ((t (:inherit bold))))
   ;; `(font-lock-type-face ((t (:inherit bold))))
   ;; `(minibuffer-prompt ((t (:inherit bold))))
   ;; `(tooltip ((t (:bold nil :italic nil :underline nil))))

   ;; ;;;;; some fontlock italics
   ;; `(font-lock-comment-face ((t (:background nil :slant italic))))
   ;; ;;`(font-lock-constant-face ((t (:weight bold))))
   ;; `(font-lock-constant-face ((t (:weight normal :slant italic))))
   ;; `(font-lock-function-name-face ((t (:weight normal))))
   ;; `(font-lock-keyword-face ((t (:weight bold :slant italic))))
   ;; `(font-lock-type-face ((t (:slant italic)))) ;:weight bold))))


   ;;;;; org
   ;; `(org-agenda-structure ((t (:inherit default ,@sans-font :height 2.0 :underline nil))))
   `(org-level-8 ((t (:inherit 'outline-8
                               ;; :weight bold
                               :height 1.0))))
   `(org-level-7 ((t (:inherit 'outline-7
                               ;; :weight bold
                               :height 1.0))))
   `(org-level-6 ((t (:inherit 'outline-6
                               ;; :weight bold
                               :height 1.0))))
   `(org-level-5 ((t (:inherit 'outline-5
                               ;; :weight bold
                               :height 1.0))))
   `(org-level-4 ((t (:inherit 'outline-4
                               ;; :weight bold
                               :height 1.0))))
   `(org-level-3 ((t (:inherit 'outline-3
                               ;; :weight bold
                               :height 1.0))))
   `(org-level-2 ((t (:inherit 'outline-2
                               ;; :weight bold
                               :height 1.0))))
   `(org-level-1 ((t (:inherit 'outline-1
                               ;; :weight bold
                               :height 1.0))))

   `(org-document-title ((t (:family "sans"
                                     :inherit org-level-1
                                     :height 1.5
                                     :underline nil
                                     :box ))))

   `(org-block ((t (:background nil :box nil))))
   ;; `(org-block-begin-line ((t (:background nil :box nil))))
   ;; `(org-block-end-line ((t (:background nil :box nil))))

   ;; `(org-block-begin-line ((t ,org-highlights)))
   ;; `(org-block-end-line ((t ,org-highlights)))
   ;; `(org-block ((t (:background ,(face-background 'highlight)))))
   ;; `(org-block-begin-line ((t (:underline t))))
   ;; `(org-block-end-line ((t (:overline t))))
   `(org-block-begin-line ((t (;; :background ,(face-background 'highlight)
                               :background nil
                               :foreground ,(face-foreground 'shadow) :underline nil :overline nil :italic t))))
   `(org-block-end-line ((t (;; :background ,(face-background 'highlight)
                               :background nil
                               :foreground ,(face-foreground 'shadow) :overline nil :underline nil :italic t))))


   `(org-checkbox ((t (:foreground "#000000", :background "#93a1a1" :box (:line-width -3 :color "#93a1a1" :style "released-button")))))

   `(org-headline-done ((t (:strike-through t))))
   `(org-done ((t (:strike-through t :underline t :overline t))))
   `(org-todo ((t (:foreground ,(face-foreground 'default) :background nil
                               :underline t :overline t))))

   ;; `(symbol-overlay-default-face ((t (:background ,(color-lighten-name (face-background 'default) 10)
   ;;                                               :foreground ,(color-darken-name (face-foreground 'default) 10)))))

   ;; `(symbol-overlay-default-face ((t (:background ,(face-foreground 'font-lock-comment-face)
   ;;                                             :foreground ,(face-background 'font-lock-comment-face)))))

   `(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0))))
   ;; `(mode-line ((t (:background ,(face-background 'default) :foreground ,(face-foreground 'default) :box ,(face-foreground 'link)))))
   ;; `(mode-line-inactive ((t (:background ,(face-background 'default) :foreground ,(face-foreground 'default) :box nil))))
   ;; '(mode-line ((t (:background "#002b36"  :foreground "white" :box "dark cyan"))))
   ;; '(mode-line-inactive ((t (:background "#002b36" :foreground "white" :box nil))))

   ;; `(highlight ((t (:box (:line-width 1 :color ,(face-foreground 'default )))))) ;; font-lock-comment-face


   ;; `(hl-line ((t (:inherit 'nil
   ;;             :background ,(face-background 'highlight) :box (:line-width 1 :color ,(face-foreground 'default ) ;; font-lock-comment-face
   ;;                                                                         )))))
   ;; `(hl-line-face((t (:box nil))))

   ;; `(objed-hl ((t (:inherit 'nil
   ;;             :background ,(face-background 'highlight) :box (:line-width 1 :color ,(face-foreground 'font-lock-comment-face) ;; font-lock-comment-face
   ;;                                                                       )))))

   ;; `(highlight ((t (:inherit 'highlight :box nil :underline nil :overline nil)))) ;; font-lock-comment-face
   ;; `(hl-line ((t (:inherit 'highlight
   ;;                      :background ,(face-background 'default)
   ;;                       ;; :underline nil :overline nil
   ;;                      :box (:line-width 1 :color ,(face-foreground 'font-lock-comment-face))
   ;;                      ))))
   ;; `(objed-hl ((t (:inherit 'highlight
   ;;                       ;; :background ,(face-background 'default)
   ;;                        :underline nil :overline nil
   ;;                       ;; :box (:line-width 1 :color ,(face-foreground 'font-lock-comment-face ))
   ;;                       ))))

   ;; `(mouse ((t (:foreground ,(face-foreground 'highlight) :background ,(face-background 'default)))))


   ;; `(region ((t (;; :inherit 'region :background ,(face-background 'region)
   ;;                        :foreground nil))))
   ;; ;; `(secondary-selection ((t (:inherit 'secondary-selection :foreground nil))))

   ;; `(highlight ((t (:inherit 'highlight ;; :box nil
   ;;                           ;; :underline nil :overline nil
   ;;                           )))) ;; font-lock-comment-face
   ;; `(hl-line ((t (:inherit 'hl-line
   ;;                         ;; :background ,(face-background 'default)
   ;;                          ;; :underline nil :overline nil
   ;;                         ;; :box (:line-width 1 :color ,(face-foreground 'font-lock-comment-face))
   ;;                         ))))
   `(objed-hl ((t (:inherit 'region ;; :inherit 'secondary-selection
                            ;; :background ,(face-background 'default)
                             ;; :underline nil :overline nil
                            ;; :box (:line-width 1 :color ,(face-foreground 'font-lock-comment-face ))
                            ))))

   `(mouse ((t (:foreground ,(face-foreground 'highlight) :background ,(face-background 'default)))))


   ;; `(tab-bar ((t (:inherit variable-pitch :background "SlateGray4" :foreground "white"))))
   ;; `(tab-bar-tab ((t (:inherit tab-bar :box nil))))
   ;; `(tab-bar-tab-inactive ((t (:inherit tab-bar-tab :background "gray5"))))


      ;;;;; display-line-number-mode
   `(line-number ((t (:weight thin :underline nil :height 0.9))))
      ;;;;; linum-mode
   `(linum ((t (:weight thin :height ,(face-attribute 'default :height) :underline nil :font ,(face-font 'default)))))
   `(linum-relative-current-face ((t (:inherit linum))))
   `(line-number-current-line ((t (:inherit line-number  scale: 1.0))))

   ;; ;;;;; linum-relative
   ;; `(linum-relative-current-face ((,class (:foreground ,comp))))

   ;;;;; modeline
   `(mode-line ((t (:inherit variable-pitch
                             :background ,(face-background 'default) ;; :foreground ,(face-foreground 'default)
                             :box (:color ,(face-foreground 'default) :line-width -2) :underline nil :overline nil :height 1.0))))

   `(mode-line-inactive ((t (:inherit variable-pitch
                                      :background ,(face-background 'default) ;; :foreground ,(face-foreground 'font-lock-comment-face)
                                      :box (:color ,(face-background 'region) :line-width -1) :height 1.0))))

   `(mode-line-buffer-id ((t (:inherit variable-pitch
                                :box (:color ,(face-foreground 'default) :line-width -1)
                                :foreground ,(face-foreground 'link)
                                :background nil :bold t :height 1.0
                                )
                                :distant-foreground ,(face-background 'region))))

   ;; `(mode-line-buffer-id-inactive ((t ( :box (:color ,(face-foreground 'font-lock-comment-face) :line-width 1)
   ;;                                  :box nil
   ;;                                       :foreground ,(face-foreground 'link)
   ;;                                 :background nil :bold t :height 1.0))))

   ;; ;; '(mode-line ((t (:background "#002b36"  :foreground "white" :box "dark cyan"))))
   ;; ;; '(mode-line-inactive ((t (:background "#002b36" :foreground "white" :box nil))))
   ;; `(spaceline-highlight-face ((t (:background ,(face-background 'default) :foreground ,(face-foreground 'default) :inherit 'mode-line))))
   ;; `(spaceline-unmodified  ((t (:background ,(face-background 'default) :foreground ,(face-foreground 'default) :inherit 'mode-line))))

   ;; ;;;;; doom-modeline
   ;; `(doom-modeline-bar ((t (:background ,(face-background 'font-lock-keyword-face)))))


   ;;;;; whitespace-mode
   ;; `(trailing-whitespace ((t nil)))
   `(whitespace-empty ((t nil)))
   `(whitespace-line ((t nil)))
   `(whitespace-newline ((t (:foreground ,(face-background 'default) :background nil))))
   `(whitespace-newline-mark ((t (:foreground ,(face-background 'default) :background nil))))
   `(whitespace-space ((t (:foreground ,(face-background 'default) :background nil))))
   `(whitespace-spaces ((t (:foreground ,(face-background 'default) :background nil))))
   `(whitespace-space-mark ((t (:foreground ,(face-background 'default) :background nil))))
   `(whitespace-tabs ((t (:foreground ,(face-background 'default) :background nil))))
   `(whitespace-tab ((t (:foreground ,(face-background 'default) :background nil))))
   `(whitespace-trailing ((t nil)))
   ;; `(whitespace-space-after-tab ((t nil)))
   ;; `(whitespace-space-before-tab ((t nil)))


   ;; ;;;;; whitespace-mode
   ;;   `(whitespace-empty ((t (:background nil))))
   ;;   `(whitespace-indentation ((t (:background nil))))
   ;;   `(whitespace-line ((t (:background nil))))
   ;;   `(whitespace-newline ((t (:background nil))))
   ;;   `(whitespace-space ((t (:background nil))))
   ;;   `(whitespace-space-after-tab ((t (:background nil))))
   ;;   `(whitespace-space-before-tab ((t (:background nil))))
   ;;   `(whitespace-tab ((t (:background nil))))
   ;;   `(whitespace-trailing ((t (:background ,err ))))

   ;; ;;;;; ivy
   ;;  `(ivy-current-match ((t (;; :underline t
   ;;                         :inherit ivy-current-match :background ,(face-foreground 'link) ;; :foreground ,(face-background 'link)
   ;;                         :box (:line-width 1 :color ,(face-foreground 'default;; font-lock-comment-face
   ;;                                                                      ))))))

   ;; `(ivy-current-match ((t (:inherit bold))))
   ;; `(ivy-minibuffer-match-face-1 ((t (:inherit bold))))
   ;; `(ivy-minibuffer-match-face-2 ((t (:underline t))))
   ;; `(ivy-minibuffer-match-face-3 ((t (:underline t))))
   ;; `(ivy-minibuffer-match-face-4 ((t (:underline t))))
   ;; `(ivy-virtual ((t (:foreground ,(face-foreground font-lock-comment-face) :slant italic))))

   ;; ;; icomplete
   ;; ;; `(icompletep-determined ((t (:box (:line-width 1 :color ,(face-foreground 'default))))))
   ;; ;; ;; ido
   ;; ;; `(ido-first-match ((t (:box (:line-width 1 :color ,(face-foreground 'default))))))
   ;; ;; `(ido-only-match ((t (((t (:box (:line-width 1 :color ,(face-foreground 'default)))))))))
   ;; ;; `(ido-subdir ((t (:inherit bold))))
   ;; ;; `(ido-virtual ((t (:inherit bold))))
   ;; ;; `(ido-incomplete-regexp ((t (:inherit bold))))
   ;; ;; `(ido-indicator ((t (:box t))))

   ;; ;;;;; swiper
   ;; `(swiper-line-face ((t (;; :underline t
   ;;                        :inherit swiper-line-face :background ,(face-foreground 'link) ;; :foreground ,(face-background 'link)
   ;;                        :box (:line-width 1 :color ,(face-foreground 'default;; font-lock-comment-face
   ;;                                                                      ))))))
   ;; `(swiper-match-face-1 ((t (:inherit bold))))
   ;; `(swiper-match-face-2 ((t (:underline t))))
   ;; `(swiper-match-face-3 ((t (:underline t))))
   ;; `(swiper-match-face-4 ((t (:underline t))))


   ;;selectrum
   `(selectrum-current-candidate ((t (:inherit 'hl-line ;; :background ,(face-background 'hl-line) :foreground ,(face-foreground 'hl-line) :bold t
                                               ;; :underline nil :overline nil
                                               :box (:line-width 1 :color ,(face-foreground 'font-lock-comment-face))))))


   ;; ;;;;; dired-subtree

   `(dired-subtree-depth-1-face ((t (:background nil)))) ;; :foreground ,(face-foreground 'default)))))
   `(dired-subtree-depth-2-face ((t (:background nil)))) ;; :foreground ,(face-foreground 'default)))))
   `(dired-subtree-depth-3-face ((t (:background nil)))) ;; :foreground ,(face-foreground 'default)))))
   `(dired-subtree-depth-4-face ((t (:background nil)))) ;; :foreground ,(face-foreground 'default)))))
   `(dired-subtree-depth-5-face ((t (:background nil)))) ;; :foreground ,(face-foreground 'default)))))
   `(dired-subtree-depth-6-face ((t (:background nil)))) ;; :foreground ,(face-foreground 'default)))))


   ;;;;; tabbar
   `(tab-bar ((t (:background ,(face-background 'default) :foreground ,(face-foreground 'default) :height 1.0 ;; :overline t
                              ;; :box (:color ,(face-foreground 'default) :line-width 1)
                              ))))
   `(tab-bar-tab ((t (:background ,(face-background 'default) :foreground ,(face-foreground 'default) :height 1.0 :inverse-video t :underline t
                                  ;; :box (:color ,(face-foreground 'default) :line-width 1)
                                  ))))
   `(tab-bar-tab-inactive ((t (:background ,(face-background 'default) :foreground ,(face-foreground 'default) :height 1.0 ;; :overline t
                                           :box (:color ,(face-foreground 'default) :line-width 2)))))
   ;;;;; tabbar
   ;; tab-line
   ;; tab-line-tab
   ;; tab-line-tab-inactive
   ;; tab-line-tab-current
   ;; tab-line-highlight
   ;; tab-line-close-highlight


   `(tab-line ((t (:background ,(face-background 'default) :foreground ,(face-foreground 'default) :height 1.0 ;; :overline t
                              ;; :box (:color ,(face-foreground 'default) :line-width 1)
                              ))))
   `(tab-line-tab ((t (:background ,(face-background 'default) :foreground ,(face-foreground 'default) :height 1.0 :inverse-video t :underline t
                                  ;; :box (:color ,(face-foreground 'default) :line-width 1)
                                   ))))
   `(tab-line-tab-inactive ((t (:background ,(face-background 'default) :foreground ,(face-foreground 'default) :height 1.0 ;; :overline t
                                           :box (:color ,(face-foreground 'default) :line-width 2)))))

   `(tab-line-tab-current ((t (:background ,(face-background 'default) :foreground ,(face-foreground 'default) :height 1.0 :inverse-video t :underline t
                                           ;; :box (:color ,(face-foreground 'default) :line-width 1)
                                           ))))

   ;;;;; dashboard
   `(dashboard-items-face ((t (:underline nil :height 0.9 ))))
   `(dashboard-no-items-face ((t (:underline nil :height 1.0 :foreground ,(face-foreground font-lock-comment-face) ))))
   `(dashboard-text-banner-face ((t (:underline nil :height 1.2))))
   ;;    (dashboard-navigator-face)
   ;;    (dashboard-heading-face)
   ;;    (dashboard-footer-face)

   ;;;; diredfl

   `(diredfl-autofile-name          ((t (:background nil :foreground ,(face-foreground 'border)))))
   `(diredfl-compressed-file-name   ((t (:background nil :foreground ,(face-foreground 'cursor)))))
   `(diredfl-compressed-file-suffix ((t (:background nil :foreground ,(doomish-blend (face-foreground 'default) (face-background 'default) 0.4)))))
   `(diredfl-date-time              ((t (:background nil :foreground ,(doomish-blend (face-foreground 'default) (face-background 'default) 0.4) :weight light :slant italic))))
   `(diredfl-deletion               ((t (:background nil :foreground ,(face-foreground 'success) :weight bold))))
   `(diredfl-deletion-file-name     ((t (:background nil :foreground ,(face-foreground 'success)))))
   `(diredfl-dir-heading            ((t (:background nil :foreground ,(face-foreground 'link) :weight bold))))
   `(diredfl-dir-name               ((t (:background nil :foreground ,(face-foreground 'link) :weight bold))))
   `(diredfl-dir-priv               ((t (:background nil :foreground ,(face-foreground 'link)))))
   `(diredfl-exec-priv              ((t (:background nil :foreground ,(face-foreground 'warning)))))
   `(diredfl-executable-tag         ((t (:background nil :foreground ,(face-foreground 'warning)))))
   `(diredfl-file-name              ((t (:background nil :foreground ,(face-foreground 'default) :weight bold))))
   `(diredfl-file-suffix            ((t (:background nil :foreground ,(doomish-blend (face-foreground 'default) (face-background 'default) 0.4)))))
   `(diredfl-flag-mark              ((t (:background nil :foreground ,(face-foreground 'shadow) :weight bold))))
   `(diredfl-flag-mark-line         ((t (:background ,(doomish-blend "#ffff00" (face-background 'default) 0.1)))))
   `(diredfl-ignored-file-name      ((t (:background nil :foreground ,(face-foreground 'font-lock-comment-face)))))
   `(diredfl-link-priv              ((t (:background nil :foreground ,(face-foreground 'trailing-whitespace)))))
   `(diredfl-no-priv                ((t (:background nil :foreground ,(face-foreground 'default)))))
   `(diredfl-number                 ((t (:background nil :foreground ,(face-foreground 'header-line)))))
   `(diredfl-other-priv             ((t (:background nil :foreground ,(face-foreground 'highlight)))))
   `(diredfl-rare-priv              ((t (:background nil :foreground ,(face-foreground 'default)))))
   `(diredfl-read-priv              ((t (:background nil :foreground ,(face-foreground 'font-lock-regexp-grouping-construct)))))
   `(diredfl-symlink                ((t (:background nil :foreground ,(face-foreground 'trailing-whitespace)))))
   `(diredfl-tagged-autofile-name   ((t (:background nil :foreground ,(face-foreground 'region)))))
   `(diredfl-write-priv             ((t (:background nil :foreground ,(face-foreground 'font-lock-variable-name-face)))))

   ))

(setq warning-minimum-level :warning)
