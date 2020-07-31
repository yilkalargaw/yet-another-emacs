(defun interleave--find-pdf-path (buffer)
  "Search the `interleave_pdf' property in BUFFER and extracts it when found."
  (with-current-buffer buffer
    (save-restriction
      (widen)
      (save-excursion
        (goto-char (point-min))
        (when (re-search-forward "^#\\+interleave_pdf: \\(.*\\)" nil :noerror)
          (match-string 1))))))
