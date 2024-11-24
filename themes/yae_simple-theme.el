;;; yae_simple

;; Copyright (C) 2024

;; Author: Yilkal Argaw

;; This file is part of GNU Emacs.

;; GNU Emacs is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; GNU Emacs is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <https://www.gnu.org/licenses/>.

;;; Code:

;;;###theme-autoload
(deftheme yae_simple
  "Adopted simple form of base16-themes for personal use"
)

(let*
      ;; ;; brewer
      ;; ((yae_simple/base00 "#0c0d0e")    ; Background
      ;;  (yae_simple/base01 "#2e2f30")    ; Darker background
      ;;  (yae_simple/base02 "#515253")    ; Selection background
      ;;  (yae_simple/base03 "#737475")    ; Cursor
      ;;  (yae_simple/base04 "#959697")    ; Inactive mode line foreground
      ;;  (yae_simple/base05 "#b7b8b9")    ; Default foreground
      ;;  (yae_simple/base06 "#dadbdc")    ; Header line foreground
      ;;  (yae_simple/base07 "#fcfdfe")    ; Brightest foreground
      ;;  (yae_simple/base08 "#e31a1c")    ; Red
      ;;  (yae_simple/base09 "#e6550d")    ; Orange
      ;;  (yae_simple/base0A "#dca060")    ; Yellow
      ;;  (yae_simple/base0B "#31a354")    ; Green
      ;;  (yae_simple/base0C "#80b1d3")    ; Cyan
      ;;  (yae_simple/base0D "#3182bd")    ; Blue
      ;;  (yae_simple/base0E "#756bb1")    ; Magenta
      ;;  (yae_simple/base0F "#b15928"))   ; Darker red

      ;; material-palen-light
      ((yae_simple/base00 "#292d3e")    ; Background
       (yae_simple/base01 "#444267")    ; Darker background
       (yae_simple/base02 "#32374d")    ; Selection background
       (yae_simple/base03 "#676e95")    ; Cursor
       (yae_simple/base04 "#8796b0")    ; Inactive mode line foreground
       (yae_simple/base05 "#959dcb")    ; Default foreground
       (yae_simple/base06 "#959dcb")    ; Header line foreground
       (yae_simple/base07 "#ffffff")    ; Brightest foreground
       (yae_simple/base08 "#f07178")    ; Red
       (yae_simple/base09 "#f78c6c")    ; Orange
       (yae_simple/base0A "#ffcb6b")    ; Yellow
       (yae_simple/base0B "#c3e88d")    ; Green
       (yae_simple/base0C "#89ddff")    ; Cyan
       (yae_simple/base0D "#82aaff")    ; Blue
       (yae_simple/base0E "#c792ea")    ; Magenta
       (yae_simple/base0F "#ff5370"))   ; Darker red


  (custom-theme-set-faces
   'yae_simple
   `(bold                         ((t (:bold t))))
   `(bold-italic                  ((t (:bold t))))
   `(border-glyph                 ((t (nil))))
   `(buffers-tab                  ((t (:foreground ,yae_simple/base05 :background ,yae_simple/base00))))
   `(mode-line                    ((t (:foreground ,yae_simple/base07 :background ,yae_simple/base01 :box nil))))
   `(mode-line-highlight          ((t (:foreground ,yae_simple/base08 :box nil))))
   `(hl-line                      ((t (:background ,yae_simple/base02))))     ;; Highlight line background 
   `(region                       ((t (:background ,yae_simple/base02))))     ;; Selection region color 
   ;; `(italic                       ((t (nil))))
   `(left-margin                  ((t (nil))))
   `(toolbar                      ((t (nil))))
   ;; `(underline                    ((nil (:underline nil))))))

;;;; basic colors
     `(border                                       ((t (:background ,yae_simple/base03))))
     `(cursor                                       ((t (:background ,yae_simple/base08))))
     `(default                                      ((t (:foreground ,yae_simple/base05 :background ,yae_simple/base00))))
     ;; `(fringe                                       ((t (:background ,yae_simple/base16-settings-fringe-bg))))
     `(fringe                       ((t (:background ,yae_simple/base00))))
     `(gui-element                                  ((t (:background ,yae_simple/base01))))
     `(header-line                                  ((t (:foreground ,yae_simple/base0E :background nil :inherit mode-line))))
     `(highlight                                    ((t (:background ,yae_simple/base01))))
     `(link                                         ((t (:foreground ,yae_simple/base0D :underline t))))
     `(link-visited                                 ((t (:foreground ,yae_simple/base0E :underline t))))
     `(minibuffer-prompt                            ((t (:foreground ,yae_simple/base0D))))
     `(region                                       ((t (:background ,yae_simple/base02 :distant-foreground ,yae_simple/base05))))
     `(secondary-selection                          ((t (:background ,yae_simple/base03 :distant-foreground ,yae_simple/base05))))
     `(trailing-whitespace                          ((t (:foreground ,yae_simple/base0A :background ,yae_simple/base0C))))
     `(vertical-border                              ((t (:foreground ,yae_simple/base02))))
     `(widget-button                                ((t (:underline t))))
     `(widget-field                                 ((t (:background ,yae_simple/base03 :box (:line-width 1 :color ,yae_simple/base06)))))

     `(error                                        ((t (:foreground ,yae_simple/base08 :weight bold))))
     `(warning                                      ((t (:foreground ,yae_simple/base09 :weight bold))))
     `(success                                      ((t (:foreground ,yae_simple/base0B :weight bold))))
     `(shadow                                       ((t (:foreground ,yae_simple/base03))))
   
;;;; font-lock
     `(font-lock-builtin-face                       ((t (:foreground ,yae_simple/base0C))))
     `(font-lock-comment-delimiter-face             ((t (:foreground ,yae_simple/base03))))
     `(font-lock-comment-face                       ((t (:foreground ,yae_simple/base03))))
     `(font-lock-constant-face                      ((t (:foreground ,yae_simple/base09))))
     `(font-lock-doc-face                           ((t (:foreground ,yae_simple/base04))))
     `(font-lock-doc-string-face                    ((t (:foreground ,yae_simple/base03))))
     `(font-lock-function-name-face                 ((t (:foreground ,yae_simple/base0D))))
     `(font-lock-keyword-face                       ((t (:foreground ,yae_simple/base0E))))
     `(font-lock-negation-char-face                 ((t (:foreground ,yae_simple/base0B))))
     `(font-lock-preprocessor-face                  ((t (:foreground ,yae_simple/base0D))))
     `(font-lock-regexp-grouping-backslash          ((t (:foreground ,yae_simple/base0A))))
     `(font-lock-regexp-grouping-construct          ((t (:foreground ,yae_simple/base0E))))
     `(font-lock-string-face                        ((t (:foreground ,yae_simple/base0B))))
     `(font-lock-type-face                          ((t (:foreground ,yae_simple/base0A))))
     `(font-lock-variable-name-face                 ((t (:foreground ,yae_simple/base08))))
     `(font-lock-warning-face                       ((t (:foreground ,yae_simple/base08))))

;;;; ansi-colors)
     `(ansi-color-black                             ((t (:foreground ,yae_simple/base02 :background ,yae_simple/base00))))
     `(ansi-color-white                             ((t (:foreground ,yae_simple/base05 :background ,yae_simple/base07))))
     `(ansi-color-red                               ((t (:foreground ,yae_simple/base08 :background ,yae_simple/base08))))
     `(ansi-color-yellow                            ((t (:foreground ,yae_simple/base0A :background ,yae_simple/base0A))))
     `(ansi-color-green                             ((t (:foreground ,yae_simple/base0B :background ,yae_simple/base0B))))
     `(ansi-color-cyan                              ((t (:foreground ,yae_simple/base0C :background ,yae_simple/base0C))))
     `(ansi-color-blue                              ((t (:foreground ,yae_simple/base0D :background ,yae_simple/base0D))))
     `(ansi-color-magenta                           ((t (:foreground ,yae_simple/base0E :background ,yae_simple/base0E))))


;; ;;;; term and ansi-term)
;;      `(term                                         ((t (:foreground ,yae_simple/base05 :background ,yae_simple/base00))))
;;      `(term-color-black                             ((t (:foreground ,yae_simple/base02 :background ,yae_simple/base00))))
;;      `(term-color-white                             ((t (:foreground ,yae_simple/base05 :background ,yae_simple/base07))))
;;      `(term-color-red                               ((t (:foreground ,yae_simple/base08 :background ,yae_simple/base08))))
;;      `(term-color-yellow                            ((t (:foreground ,yae_simple/base0A :background ,yae_simple/base0A))))
;;      `(term-color-green                             ((t (:foreground ,yae_simple/base0B :background ,yae_simple/base0B))))
;;      `(term-color-cyan                              ((t (:foreground ,yae_simple/base0C :background ,yae_simple/base0C))))
;;      `(term-color-blue                              ((t (:foreground ,yae_simple/base0D :background ,yae_simple/base0D))))
;;      `(term-color-magenta                           ((t (:foreground ,yae_simple/base0E :background ,yae_simple/base0E))))

	 ))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

;;;###autoload
(defun yae_simple-theme()
  "Load yae_simple-theme."
  (interactive)
  (load-theme 'yae_simple t))

(provide-theme 'yae_simple)

;;; yae_simple-theme.el ends here
