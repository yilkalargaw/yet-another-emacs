(defun my-move-upto-char (arg char)
  "Move up to the ARGth occurrence of CHAR.
Case is ignored if `case-fold-search' is non-nil in the current buffer.
Goes backward if ARG is negative; error if CHAR not found."

  (let ((direction (if (>= arg 0) 1 -1)))
    ;; Avoid "obsolete" warnings for translation-table-for-input.
    (with-no-warnings
      (if (char-table-p translation-table-for-input)
	  (setq char (or (aref translation-table-for-input char) char))))
    (forward-char direction)
    (unwind-protect
	(search-forward (char-to-string char) nil nil arg)
      (backward-char direction))))


(defun my-move-back-upto-char (arg char)
  "Move back to the ARGth occurrence of CHAR.
Case is ignored if `case-fold-search' is non-nil in the current buffer.
Goes forward if ARG is negative; error if CHAR not found."

  (let ((narg (- 0 arg)))
    ;; Avoid "obsolete" warnings for translation-table-for-input.
    (with-no-warnings
      (if (char-table-p translation-table-for-input)
	  (setq char (or (aref translation-table-for-input char) char))))
    (search-forward (char-to-string char) nil nil narg)))


(defun my-vim-f (arg char)
  (interactive (list (prefix-numeric-value current-prefix-arg)
		     (read-char "move-back-upto-char: " t)))

  (if (< arg 0) (my-move-back-upto-char (- 0 arg) char)
    (my-move-upto-char arg char)))
