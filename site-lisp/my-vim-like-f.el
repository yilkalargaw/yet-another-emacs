(defun my-vim-like-f (char count)
  "Move to the COUNT-th occurrence of CHAR on the current line."
  (interactive "cMove to char: \np")
  (let ((pos (point))
        (found nil)
        (direction 1)
        (line-end (line-end-position)))
    (dotimes (_ count)
      (setq pos (save-excursion
                  (if (eq direction 1)
                      (search-forward (char-to-string char) line-end t)
                    (search-backward (char-to-string char) (line-beginning-position) t))))
      (if pos
          (progn
            (setq found t)
            (goto-char pos))
        (setq found nil)))
    (unless found
      (message "Character '%c' not found on this line" char))))


(defun my-vim-like-F (char count)
  "Move to the COUNT-th occurrence of CHAR on the current line in reverse."
  (interactive "cMove to char: \np")
  (let ((direction -1))
    (my-vim-like-f char count)))



;; (global-set-key (kbd "C-c f") 'my-vim-like-f)
;; (global-set-key (kbd "C-c F") 'my-vim-like-F)
