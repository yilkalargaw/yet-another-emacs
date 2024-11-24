;;; custom-faces.el --- contains custom faces I set to have more uniform themes.

;;; Commentary:


;;; Usage:

;;; Code:

;; (setq warning-minimum-level :emergency)

;; (defcustom modified-org-beautify-theme-use-box-hack 't
;;   "Use a 3 pixel box with the background color to add spacing.
;;   Note that this has a side effect that can make the theme look
;;   really bad under some circumstances."
;;   :type 'boolean)


(require 'color)
(require 'faces)
(defun my-format-color (color)
  "Change color.el name format COLOR to six digit hex."
  (concat "#" (substring color 1 3) (substring color 5 7) (substring color 9 11)))

(let* (;; (base-font-color (face-foreground 'default  nil 'default))
       ;; (background-color (face-background 'default nil 'default))
       ;; (headline `(:inherit default :foreground ,base-font-color))
       ;; ;; (primary-color (face-foreground 'mode-line nil))
       ;; (secondary-color (face-background 'secondary-selection nil 'region))
       ;; (org-highlights `(:foreground ,base-font-color :background ,secondary-color))
       (bg-color (if EMACS27+
                   (unless (string-equal (face-background 'default) "unspecified-bg")
                     (apply 'color-rgb-to-hex (append (color-name-to-rgb (face-background 'default)) '(2))))
				   (face-background 'default)))
       (fg-color (if EMACS27+
                   (unless (string-equal (face-background 'default) "unspecified-bg")
                     (apply 'color-rgb-to-hex (append (color-name-to-rgb (face-background 'default)) '(2))))
				   (face-foreground 'default)))
       )

;; (defun light-p (color)
;;   "Return t if COLOR is light."
;;   (>= (/ (- (apply #'max color)
;;              (apply #'min color))
;;           (apply #'max color))
;;       0.5))

;; (defun light-p (color)
;;   "Return t if COLOR is light, nil otherwise."
;;   (let ((rgb (color-values color)))
;;     (> (+ (* 0.299 (nth 0 rgb))
;;           (* 0.587 (nth 1 rgb))
;;           (* 0.114 (nth 2 rgb)))
;;        (/ 255.0 2))))

;;   (defun light-p (color)
;; 	"Checks if the color is light.
;;    color  The color to check.
;;    Returns non-nil if the color is light, nil if it is dark."
;; 	(let* ((hsl (apply #'color-rgb-to-hsl
;; 					   (color-name-to-rgb color)))
;;            (lightness (* (nth 2 hsl) 100)))
;;       (>= lightness 50)))

;; (defun dark-p (color)
;;   "Return t if COLOR is dark."
;;   (not (light-p color)))

(defun light-p (color)
  "Check if the COLOR is on the lighter side.  The color to check.
Returns non-nil if the color is light, nil if it is dark."
  (when color
    (let* ((hsl (apply #'color-rgb-to-hsl
                       (color-name-to-rgb color)))
           (lightness (* (nth 2 hsl) 100)))
      (>= lightness 50))))

(defun dark-p (color)
  "Return t if COLOR is dark."
  (when color
    (not (light-p color))))

;; (defun light-p (color)
;;   "Checks if the color is light.
;;    color  The color to check.
;;    Returns non-nil if the color is light, nil if it is dark."
;;   (let ((components (color-name-to-rgb color)))
;;     (>= (/ (- (apply #'max components) (apply #'min components)) (apply #'max components)) 0.5)))

;; (defun dark-p (color)
;;   "Checks if the color is dark.
;;    color  The color to check.
;;    Returns non-nil if the color is light, nil if it is dark."
;;   (not light-p))


;; (defun yae-lighten-or-darken-color (color percent)
;;   "Lighten or darken COLOR by PERCENT."
;;   (let* ((color-rgb (color-name-to-rgb color))
;;          (r (car color-rgb))
;;          (g (cadr color-rgb))
;;          (b (caddr color-rgb))
;;          (new-r (+ r (* (/ percent 100.0) (- 255 r))))
;;          (new-g (+ g (* (/ percent 100.0) (- 255 g))))
;;          (new-b (+ b (* (/ percent 100.0) (- 255 b)))))
;;     (apply 'color-rgb-to-hex `(,new-r ,new-g ,new-b))))

;; (defun yae-lighten-or-darken-color (color percent)
;;   "Lighten or darken COLOR by PERCENT."
;;   (let* ((color-str (if (string-prefix-p "#" color)
;;                         color
;;                       (substring color 2)))
;;          (color-rgb (color-name-to-rgb color-str))
;;          (r (car color-rgb))
;;          (g (cadr color-rgb))
;;          (b (caddr color-rgb))
;;          (new-r (+ r (* (/ percent 100.0) (- 255 r))))
;;          (new-g (+ g (* (/ percent 100.0) (- 255 g))))
;;          (new-b (+ b (* (/ percent 100.0) (- 255 b)))))
;;     (if (= (length color-str) 6)
;;         (apply 'color-rgb-to-hex `(,new-r ,new-g ,new-b))
;;       (if (= (length color-str) 3)
;;           (substring color-str 1)
;;         (concat "#" (format "%02x" new-r) (format "%02x" new-g) (format "%02x" new-b))))))

;; (defun yae-lighten-or-darken-color (color percent)
;;   "Lighten or darken COLOR by PERCENT.
;; If the color is light and the percent is small, do not darken it to black."
;;   (let* ((color-str (if (string-prefix-p "#" color)
;; 						color
;; 					  (substring color 2)))
;; 		 (color-rgb (color-name-to-rgb color-str))
;; 		 (r (car color-rgb))
;; 		 (g (cadr color-rgb))
;; 		 (b (caddr color-rgb))
;; 		 (new-r (+ r (* (/ percent 100.0) (- 255 r))))
;; 		 (new-g (+ g (* (/ percent 100.0) (- 255 g))))
;; 		 (new-b (+ b (* (/ percent 100.0) (- 255 b)))))
;; 	(if (= (length color-str) 6)
;; 		(apply 'color-rgb-to-hex `(,new-r ,new-g ,new-b))
;; 	  (if (= (length color-str) 3)
;; 		  (substring color-str 1)
;; 		(let ((min-r 128)
;; 			  (min-g 128)
;; 			  (min-b 128))
;; 		  (cond ((>= r min-r) (concat "#" (format "%02x" new-r) (format "%02x" new-g) (format "%02x" new-b)))
;; 				((>= g min-g) (concat "#" (format "%02x" r) (format "%02x" new-g) (format "%02x" new-b)))
;; 				((>= b min-b) (concat "#" (format "%02x" r) (format "%02x" g) (format "%02x" new-b)))
;; 				(t color)))))))


;; (defun yae-lighten-or-darken-color (color percent)
;;   "Lighten or darken COLOR by PERCENT."
;;   (let* ((color-str (if (string-prefix-p "#" color)
;;                         color
;;                       (substring color 2)))
;;          (color-rgb (color-name-to-rgb color-str))
;;          (r (car color-rgb))
;;          (g (cadr color-rgb))
;;          (b (caddr color-rgb))
;;          (new-r (+ r (* (/ percent 100.0) (- 255 r))))
;;          (new-g (+ g (* (/ percent 100.0) (- 255 g))))
;;          (new-b (+ b (* (/ percent 100.0) (- 255 b)))))
;;     (if (= (length color-str) 6)
;;         (apply 'color-rgb-to-hex `(,new-r ,new-g ,new-b))
;;       (if (= (length color-str) 3)
;;           (substring color-str 1)
;;         (concat "#" (format "%02x" new-r) (format "%02x" new-g) (format "%02x" new-b))))))

;; (defun yae-lighten-or-darken-color (color percent)
;;   "Lighten or darken COLOR by PERCENT."
;;   (let* ((color-str (if (string-prefix-p "#" color)
;;                         color
;;                       (substring color 2)))
;;          (color-rgb (color-name-to-rgb color-str))
;;          (r (car color-rgb))
;;          (g (cadr color-rgb))
;;          (b (caddr color-rgb))
;;          (new-r (+ r (* (/ percent 100.0) (- 255 r))))
;;          (new-g (+ g (* (/ percent 100.0) (- 255 g))))
;;          (new-b (+ b (* (/ percent 100.0) (- 255 b)))))
;;         (apply 'color-rgb-to-hex `(,new-r ,new-g ,new-b))))


  (defun doomish-name-to-rgb (color)
    "Retrieves the hexidecimal string repesented the named COLOR (e.g. \"red\")
for FRAME (defaults to the current frame)."
    (cl-loop with div = (float (car (tty-color-standard-values "#ffffff")))
             for x in (tty-color-standard-values (downcase color))
             collect (/ x div)))


  (defun doom-color (name &optional type)
	"Retrieve a specific color named NAME (a symbol) from the current theme."
	(let ((colors (when (listp name)
                      name
					;; (cdr-safe (assq name doom-themes--colors))
					)))
      (and colors
           (cond ((listp colors)
                  (let ((i (or (plist-get '(256 1 16 2 8 3) type) 0)))
					(if (> i (1- (length colors)))
						(car (last colors))
                      (nth i colors))))
				 (t colors)))))
  
  (defun doomish-blend (color1 color2 alpha)
    "Blend two colors (hexidecimal strings) together by a coefficient ALPHA (a
float between 0 and 1)"
    (when (and color1 color2)
      (cond ((and color1 color2 (symbolp color1) (symbolp color2))
             (doomish-blend (doom-color color1) (doom-color color2) alpha))

            ((or (listp color1) (listp color2))
             (cl-loop for x in color1
                      when (if (listp color2) (pop color2) color2)
                      collect (doomish-blend x it alpha)))

            ((and (string-prefix-p "#" color1) (string-prefix-p "#" color2))
             (apply (lambda (r g b) (format "#%02x%02x%02x" (* r 255) (* g 255) (* b 255)))
                    (cl-loop for it    in (doomish-name-to-rgb color1)
                             for other in (doomish-name-to-rgb color2)
                             collect (+ (* alpha it) (* other (- 1 alpha))))))

            (color1))))

  (defun doomish-darken (color alpha)
	"Darken a COLOR (a hexidecimal string) by a coefficient ALPHA (a float between
0 and 1)."
	(cond ((and color (symbolp color))
           (doomish-darken (doom-color color) alpha))

          ((listp color)
           (cl-loop for c in color collect (doomish-darken c alpha)))

          ((doomish-blend color "#000000" (- 1 alpha)))))

  (defun doomish-lighten (color alpha)
	"Brighten a COLOR (a hexidecimal string) by a coefficient ALPHA (a float
between 0 and 1)."
	(cond ((and color (symbolp color))
           (doomish-lighten (doom-color color) alpha))

          ((listp color)
           (cl-loop for c in color collect (doomish-lighten c alpha)))

          ((doomish-blend color "#FFFFFF" (- 1 alpha)))))

  ;; (unless (facep 'mode-line)
  ;; 	(defface mode-line '((t (:inherit variable-pitch
  ;; 									  :background ,(if (dark-p (color-name-to-rgb (face-background 'default)))
  ;; 													   (color-lighten-name (face-background 'default) 40)
  ;; 													 (color-darken-name (face-background 'default) 40)))))
  ;; 	  "Face used for the mode line." :group 'basic-faces))




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


   `(org-checkbox ((t (:foreground "#000000", :background "#93a1a1" ;; :box (:line-width -3 :color "#93a1a1" :style "released-button")
								   ))))

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

   ;; `(highlight ((t (:background ,(doomish-blend (face-background 'default) (face-background 'region) 0.1) ;; :box (:line-width 1 :color ,(face-foreground 'default ))
   ;; 								)))) ;; font-lock-comment-face


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

   `(mouse ((t (:foreground ,(face-foreground 'highlight) :background ,(face-background 'default)))))


   ;; `(region ((t (;; :inherit 'region :background ,(face-background 'region)
   ;;                :background nil :foreground nil))))
   ;; `(secondary-selection ((t (:inherit 'secondary-selection :foreground nil))))

   ;; `(highlight ((t (:inherit 'highlight ;; :box nil
   ;;                           ;; :underline nil :overline nil
   ;;                           )))) ;; font-lock-comment-face
   ;; `(hl-line ((t (;; :inherit 'hl-line
   ;;                         ;; :background ,(face-background 'default)
   ;;                          ;; :underline nil :overline nil
   ;;                         :box (:line-width 1 :color ,(face-foreground 'font-lock-comment-face))
   ;;                               ))))

   ;; `(objed-hl ((t (;; :inherit 'region
   ;;                           ;; :inherit 'secondary-selection
   ;;                          ;; :background ,(face-background 'default)
   ;;                           ;; :underline nil :overline nil
   ;;                          :box (:line-width 1 :color ,(face-foreground 'font-lock-comment-face ))
   ;;                          ))))

   ;; `(tab-bar ((t (:inherit variable-pitch :background "SlateGray4" :foreground "white"))))
   ;; `(tab-bar-tab ((t (:inherit tab-bar :box nil))))
   ;; `(tab-bar-tab-inactive ((t (:inherit tab-bar-tab :background "gray5"))))

   ;; ;;;;; modeline

   ;; `(mode-line ((t (:background ,(if (dark-p (color-name-to-rgb (face-background 'default)))
   ;;                                  (color-lighten-name (face-background 'default) 50)
   ;;                                 (color-darken-name (face-background 'default) 50))
   ;; 								:box nil))))

   ;; (let ((bg-color (doomish-blend (face-foreground 'shadow) (face-background 'default) 0)))
   ;; 	 `(mode-line ((t (:inherit variable-pitch
   ;;                             ;; :background ,bg-color
   ;; 							   :background nil
   ;; 							   ;; :foreground ,(face-foreground 'default)
   ;; 							   :foreground ,(apply 'color-rgb-to-hex (color-complement bg-color))
   ;;                             :box (:color ,(face-foreground 'default) :line-width 1)
   ;; 							   ;; :box nil
   ;; 							   :underline nil :overline nil :height 1.0)))))


   ;; (let ((bg-color (doomish-blend (doomish-blend (face-background 'link) (face-background 'default) 0) (face-background 'default) 1)))
   ;; 	 `(mode-line-inactive ((t (:inherit variable-pitch
   ;; 										;; :background ,bg-color
   ;; 										:background nil
   ;; 										:foreground ,(face-foreground 'font-lock-comment-face)
   ;; 										;; :foreground ,(apply 'color-rgb-to-hex (color-complement bg-color))
   ;; 										:box (:color ,(face-foreground 'font-lock-comment-face) :line-width 1)
   ;; 										;; :box nil
   ;; 										:underline nil :overline nil :height 1.0
   ;; 										:italic t)))))

   ;; `(mode-line-buffer-id ((t (:inherit variable-pitch
   ;;                                     ;; :box (:color ,(face-foreground 'default) :line-width -1)
   ;;                                     ;; :background ,(face-background 'default)
   ;;                                     :background nil
   ;;                                     :foreground ,(face-foreground 'link)
   ;;                                     :bold t :height 1.0
   ;;                                     :distant-foreground ,(face-background 'region)))))

	 `(mode-line ((t (:inherit variable-pitch
							   :background ,(if (dark-p bg-color)
												(doomish-lighten bg-color 0.15)
											  (doomish-darken bg-color 0.15))
							   ;; :background nil
							   :foreground ,(face-foreground 'default)
							   :box nil
							   :box (:color ,(if (dark-p bg-color)
														 (doomish-darken bg-color 0.20)
														(doomish-lighten bg-color 0.20))
													 :line-width 1)
							   ;; :box (:color ,(face-foreground 'default) :line-width 1)
							   ;; :box nil
							   ;; :underline nil :overline nil :height 1.0
							   :bold t
							   ))))

	 `(mode-line-inactive ((t (:inherit variable-pitch
										:background ,(if (dark-p bg-color)
														 (doomish-lighten bg-color 0.07)
													   (doomish-darken bg-color 0.07))
										;; :background nil
										:foreground ,(face-foreground 'font-lock-comment-face)
										:box nil
										:box (:color ,(if (dark-p bg-color)
														 (doomish-darken bg-color 0.07)
														(doomish-lighten bg-color 0.07))
													 :line-width 1)
										;; :box (:color ,(face-background 'font-lock-comment-face) :line-width 1)
										;; :box nil
										;; :height 1.0
										:italic t
										))))
 

   ;; ;;;;; modeline
   ;; `(mode-line ((t (:inherit variable-pitch
   ;;                           ;; :background ,(face-background 'default)
   ;;                           :background nil
   ;;                           :foreground ,(face-foreground 'default)
   ;;                           :box (:color ,(face-foreground 'default) :line-width 1) :underline nil :overline nil :height 1.0))))

   ;; `(mode-line-inactive ((t (:inherit variable-pitch
   ;;                                    ;; :background ,(face-background 'default)
   ;;                                    :background nil
   ;;                                    :foreground ,(face-foreground 'font-lock-comment-face)
   ;;                                    :box (:color ,(face-background 'region) :line-width 1) :height 1.0))))

   `(mode-line-buffer-id ((t (:inherit variable-pitch
                                       ;; :box (:color ,(face-foreground 'default) :line-width -1)
                                       ;; :background ,(face-background 'default)
                                       :background nil
                                       :foreground ,(face-foreground 'link)
                                       :bold t :height 1.0
                                       :distant-foreground ,(face-background 'region)))))


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


   ;;header-line
   `(header-line ((t (:inverse-video nil :background ,(face-background 'default) :box nil :style nil))))

   ;; menu & toolbar
  `(menu ((t (:background ,(face-background 'default) :foreground ,(face-foreground 'default) :italic nil :height 1.0 :bold t :underline nil))))
  `(tool-bar ((t (:background ,(face-background 'default) :foreground ,(face-foreground 'default) :italic nil :height 1.0 :bold t :underline nil))))

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

   `(icomplete-selected-match
	 ((t (:foreground ,(doomish-blend (face-foreground 'link) (face-foreground 'default) 1.0)
		  :underline t :overline nil :bold t :italic nil :height 1.05))))
   `(completions-common-part
	 ((t (:foreground ,(doomish-blend (face-foreground 'link) (face-foreground 'default) 0.7)
		  :height 1.0 :bold nil :italic nil :bold t))))
   `(completions-first-difference
	 ((t (:foreground ,(doomish-blend (face-foreground 'font-lock-string-face) (face-background 'default) 0.6)
		  :italic nil :height 1.0 :bold t :underline nil))))

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
   ;; `(selectrum-current-candidate ((t (:inherit 'hl-line ;; :background ,(face-background 'hl-line) :foreground ,(face-foreground 'hl-line) :bold t
   ;;                                             ;; :underline nil :overline nil
   ;;                                             :box (:line-width 1 :color ,(face-foreground 'font-lock-comment-face))))))


   ;; ;;;;; dired-subtree

   `(dired-subtree-depth-1-face ((t (:background nil)))) ;; :foreground ,(face-foreground 'default)))))
   `(dired-subtree-depth-2-face ((t (:background nil)))) ;; :foreground ,(face-foreground 'default)))))
   `(dired-subtree-depth-3-face ((t (:background nil)))) ;; :foreground ,(face-foreground 'default)))))
   `(dired-subtree-depth-4-face ((t (:background nil)))) ;; :foreground ,(face-foreground 'default)))))
   `(dired-subtree-depth-5-face ((t (:background nil)))) ;; :foreground ,(face-foreground 'default)))))
   `(dired-subtree-depth-6-face ((t (:background nil)))) ;; :foreground ,(face-foreground 'default)))))


   ;; ;;;;; tabbar
   ;; `(tab-bar ((t (:background ,(face-background 'default) :foreground ,(face-foreground 'default) :height 1.0 ;; :overline t
   ;;                            ;; :box (:color ,(face-foreground 'default) :line-width 1)
   ;;                            ))))
   ;; `(tab-bar-tab ((t (:background ,(face-background 'default) :foreground ,(face-foreground 'default) :height 1.0 :inverse-video t :underline t
   ;;                                ;; :box (:color ,(face-foreground 'default) :line-width 1)
   ;;                                ))))
   ;; `(tab-bar-tab-inactive ((t (:background ,(face-background 'default) :foreground ,(face-foreground 'default) :height 1.0 ;; :overline t
   ;;                                         :box (:color ,(face-foreground 'default) :line-width 2)))))
   ;; ;;;;; tabbar
   ;; ;; tab-line
   ;; ;; tab-line-tab
   ;; ;; tab-line-tab-inactive
   ;; ;; tab-line-tab-current
   ;; ;; tab-line-highlight
   ;; ;; tab-line-close-highlight


   ;; `(tab-line ((t (:background ,(face-background 'default) :foreground ,(face-foreground 'default) :height 1.0 ;; :overline t
   ;;                             ;; :box (:color ,(face-foreground 'default) :line-width 1)
   ;;                             ))))
   ;; `(tab-line-tab ((t (:background ,(face-background 'default) :foreground ,(face-foreground 'default) :height 1.0 :inverse-video t :underline t
   ;;                                 ;; :box (:color ,(face-foreground 'default) :line-width 1)
   ;;                                 ))))
   ;; `(tab-line-tab-inactive ((t (:background ,(face-background 'default) :foreground ,(face-foreground 'default) :height 1.0 ;; :overline t
   ;;                                          :box (:color ,(face-foreground 'default) :line-width 2)))))

   ;; `(tab-line-tab-current ((t (:background ,(face-background 'default) :foreground ,(face-foreground 'default) :height 1.0 :inverse-video t :underline t
   ;;                                         ;; :box (:color ,(face-foreground 'default) :line-width 1)
   ;;                                         ))))

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

   `(highlight-indent-guides-odd-face       ((t (:background ,(face-background 'default) :foreground ,(face-foreground 'region)))))
   `(highlight-indent-guides-even-face      ((t (:background ,(face-background 'default) :foreground ,(face-foreground 'font-lock-comment-face)))))
   `(highlight-indent-guides-character-face ((t (:background ,(face-background 'default) :foreground ,(face-foreground 'font-lock-comment-face)))))

   `(fringe ((t (:background ,(face-background 'default) :foreground ,(face-foreground 'font-lock-comment-face)))))

	;;;;; display-line-number-mode
   `(line-number ((t (:background ,(face-background 'default) :foreground ,(face-foreground 'font-lock-comment-face)))))
   `(line-number-current-line ((t (:background ,(face-background 'default) :foreground ,(face-foreground 'font-lock-comment-face) :weight extra-bold ))))
    ;; `(line-number ((t (:inherit linum :weight thin :inherit line-number :weight thin :underline nil :height 0.8 :italic t))))
    ;;;;; linum-mode
   ;; `(linum ((t (:inherit line-number :weight thin :height 0.8 :underline nil :font ,(face-font 'highlight) :italic t))))
   `(linum ((t (:background ,(face-background 'default) :foreground ,(face-foreground 'font-lock-comment-face)))))
   `(linum-relative-current-face ((t (:inherit linum :height 1.0 :weight extra-bold :italic nil))))

   ))

(setq warning-minimum-level :warning)

(provide 'custom-faces)
;;; custom_faces.el ends here
