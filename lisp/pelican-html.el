(require 'org)
(require 'ox)
(require 'ox-html)
(require 's)
(require 'dash)
(require 'org-element)

(org-export-define-derived-backend 'pelican-html 'html
  :translate-alist '((src-block .  pelican/pygments-org-html-code)
                     (example-block . pelican/pygments-org-html-code)
                     (link . pelican/link-html)))

(defvar pygments-path "pygmentize")

(defun pelican/pygments-org-html-code (code contents info)
  "Process code block with Pygments
See http://pygments.org/ for details"

  ;; Generate temp file path by hashing current time and date.
  (setq temp-source-file(format "/tmp/pygmentize-%s.txt"(md5 (current-time-string))))
  ;; Writing temp file
  (with-temp-file temp-source-file (insert (org-element-property :value code)))
  ;; Processing
  (shell-command-to-string (format "%s -l \"%s\" -f html %s"
                                   pygments-path
                                   (or (org-element-property :language code)
                                       "")
                                   temp-source-file)))


(defun pelican/link-html (link desc info)
  "Custom syntax for setting :attrs-html directly to link
Syntax: [[http://example.com/#|:attr value][Link text]]"

  (setq extra-attrs (org-element-property :extra-attrs link))
  (setq processed-link-html (org-html-link link desc info))
  (if extra-attrs
      ;; If link has any attributes defined
      (progn
        ;; Creating extra attrs string in key="value" format
        (setq extra-attrs
              (s-trim (--reduce-from (concat acc " "
                                             (format "%s=%s" (nth 0 it)
                                                     (s-wrap (nth 1 it)  "\""))) "" extra-attrs)))

        ;; Insert parameters in link tag
        ;; Exmaple: <a href="#" name="Foo">Bar</a>
        (setq insert-point (string-match ">" processed-link-html))
        (setq processed-link-html
              (concat (substring  processed-link-html 0 insert-point)
                      extra-attrs
                      (substring processed-link-html insert-point))))
    ;; Return link html
    processed-link-html))



(defun pelican/org-link-extra-attrs (orig-fun &rest args)
  "Post processor for link-parser"
  (setq parser-result orig-fun)

  ;;; Getting inital values that should be replaced
  (setq raw-path (plist-get (nth 1 parser-result) :raw-link))
  (setq path (plist-get (nth 1 parser-result) :raw-link))

  ;; Check if link match the regexp
  (if (string-match-p "^https?://.*|\s?:" raw-path)
      (progn
        ;; Retrieving parameters after vertical slash and decode it.
        (setq results (s-split "|" (url-unhex-string raw-path)))
        ;; Cleaning urls
        (setq raw-path (car results))
        (setq path (car (s-split "|" path)))

        ;; Split by colon and drop empty values (if any).
        (setq results (--drop-while (< (length it) 1)
                                    (s-split ":" (car (-slice results 1)))))
        ;; Split key and value and trim spaces
        (setq results (--map  (s-split-up-to "\s" (s-trim it) 1) results))
        ;; Updating parser result with new attributes

        (setq orig-fun-cleaned (plist-put (nth 1 orig-fun) :raw-link raw-path))
        (setq orig-fun-cleaned (plist-put orig-fun-cleaned :path path))

        (list 'link
              (-snoc orig-fun-cleaned :extra-attrs results)))

         ;; Else retun original function result
         orig-fun))

(advice-add 'org-element-link-parser :filter-return #'pelican/org-link-extra-attrs)

(provide 'pelican-html)
