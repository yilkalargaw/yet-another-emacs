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

   ;; `(org-block ((t (:foreground ,base-font-color
   ;;                              :background nil :box nil))))

   ;; `(org-block-begin-line ((t ,org-highlights)))
   ;; `(org-block-end-line ((t ,org-highlights)))
   ;; `(org-block ((t (:background ,(face-background 'highlight)))))
   ;; `(org-block-begin-line ((t (:underline t))))
   ;; `(org-block-end-line ((t (:overline t))))
   `(org-block-begin-line ((t (;; :background ,(face-background 'highlight)
                               :foreground ,(face-foreground 'shadow))))) ;; :underline t :overline t :italic t))))
   `(org-block-end-line ((t (;; :background ,(face-background 'highlight)
                             :foreground ,(face-foreground 'shadow) )))) ;; :overline t :underline t :italic t))))


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
   `(mode-line ((t (:background ,(face-background 'default) :foreground ,(face-foreground 'default)
				:box (:color ,(face-foreground 'default) :line-width 1) :underline nil :overline nil :height 1.0))))
   `(mode-line-inactive ((t (:background ,(face-background 'default) :foreground ,(face-foreground 'default)
					 :box (:color ,(face-foreground 'font-lock-comment-face) :line-width 1) :height 1.0))))
   `(mode-line-buffer-id ((t (:box (:color ,(face-foreground 'link) :line-width 2) :foreground ,(face-foreground 'link)
				   :background nil :bold t :height 1.0))))
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
   `(whitespace-newline ((t (:inherit nil :foreground ,(face-background 'default) :background nil))))
   `(whitespace-newline-mark ((t (:inherit nil :foreground ,(face-background 'default) :background nil))))
   `(whitespace-space ((t (:inherit nil :foreground ,(face-background 'default) :background nil))))
   `(whitespace-spaces ((t (:inherit nil :foreground ,(face-background 'default) :background nil))))
   `(whitespace-space-mark ((t (:inherit nil :foreground ,(face-background 'default) :background nil))))
   `(whitespace-tabs ((t (:inherit nil :foreground ,(face-background 'default) :background nil))))
   `(whitespace-tab ((t (:inherit nil :foreground ,(face-background 'default) :background nil))))
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
   `(ivy-current-match ((t (:inherit bold))))
   `(ivy-minibuffer-match-face-1 ((t (:inherit bold))))
   `(ivy-minibuffer-match-face-2 ((t (:underline t))))
   `(ivy-minibuffer-match-face-3 ((t (:underline t))))
   `(ivy-minibuffer-match-face-4 ((t (:underline t))))
   `(ivy-virtual ((t (:foreground ,(face-foreground font-lock-comment-face) :slant italic))))


   ;; ;;;;; swiper
   ;; `(swiper-line-face ((t (;; :underline t
   ;;                        :inherit swiper-line-face :background ,(face-foreground 'link) ;; :foreground ,(face-background 'link)
   ;;                        :box (:line-width 1 :color ,(face-foreground 'default;; font-lock-comment-face
   ;;                                                                      ))))))
   ;; `(swiper-match-face-1 ((t (:inherit bold))))
   ;; `(swiper-match-face-2 ((t (:underline t))))
   ;; `(swiper-match-face-3 ((t (:underline t))))
   ;; `(swiper-match-face-4 ((t (:underline t))))


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

   ))

(setq warning-minimum-level :warning)
