
(defhydra hydra-buffer-zoom (:hint nil :quit-key ("q" "C-g"))
  "zoom"
  ("g" text-scale-increase "in")
  ("l" text-scale-decrease "out")
  ("o" (text-scale-adjust 0) "reset")
  )

;; (defhydra hydra-global-zoom (:hint nil)
;;   "zoom"
;;   ("g" default-text-scale-increase "in")
;;   ("l" default-text-scale-decrease "out")
;;   ("o" default-text-scale-reset "reset")
;;   )


(defhydra hydra-ibuffer-main (:color pink :hint nil :quit-key ("q" "C-g"))
  "
 ^Navigation^ | ^Mark^        | ^Actions^        | ^View^
-^----------^-+-^----^--------+-^-------^--------+-^----^-------
  _k_:    ʌ   | _m_: mark     | _D_: delete      | _g_: refresh
 _RET_: visit | _u_: unmark   | _S_: save        | _s_: sort
  _j_:    v   | _*_: specific | _a_: all actions | _/_: filter
-^----------^-+-^----^--------+-^-------^--------+-^----^-------
"
  ("j" ibuffer-forward-line)
  ("RET" ibuffer-visit-buffer :color blue)
  ("k" ibuffer-backward-line)

  ("m" ibuffer-mark-forward)
  ("u" ibuffer-unmark-forward)
  ("*" hydra-ibuffer-mark/body :color blue)

  ("D" ibuffer-do-delete)
  ("S" ibuffer-do-save)
  ("a" hydra-ibuffer-action/body :color blue)

  ("g" ibuffer-update)
  ("s" hydra-ibuffer-sort/body :color blue)
  ("/" hydra-ibuffer-filter/body :color blue)

  ("o" ibuffer-visit-buffer-other-window "other window" :color blue)
  ("q" quit-window "quit ibuffer" :color blue)
  ("." nil "toggle hydra" :color blue))

(defhydra hydra-ibuffer-mark (:color teal :columns 5
                              :after-exit (hydra-ibuffer-main/body) :quit-key ("q" "C-g"))
  "Mark"
  ("*" ibuffer-unmark-all "unmark all")
  ("M" ibuffer-mark-by-mode "mode")
  ("m" ibuffer-mark-modified-buffers "modified")
  ("u" ibuffer-mark-unsaved-buffers "unsaved")
  ("s" ibuffer-mark-special-buffers "special")
  ("r" ibuffer-mark-read-only-buffers "read-only")
  ("/" ibuffer-mark-dired-buffers "dired")
  ("e" ibuffer-mark-dissociated-buffers "dissociated")
  ("h" ibuffer-mark-help-buffers "help")
  ("z" ibuffer-mark-compressed-file-buffers "compressed")
  ("b" hydra-ibuffer-main/body "back" :color blue))

(defhydra hydra-ibuffer-action (:color teal :columns 4
                                :after-exit
                                (if (eq major-mode 'ibuffer-mode)
                                    (hydra-ibuffer-main/body)) :quit-key ("q" "C-g"))
  "Action"
  ("A" ibuffer-do-view "view")
  ("E" ibuffer-do-eval "eval")
  ("F" ibuffer-do-shell-command-file "shell-command-file")
  ("I" ibuffer-do-query-replace-regexp "query-replace-regexp")
  ("H" ibuffer-do-view-other-frame "view-other-frame")
  ("N" ibuffer-do-shell-command-pipe-replace "shell-cmd-pipe-replace")
  ("M" ibuffer-do-toggle-modified "toggle-modified")
  ("O" ibuffer-do-occur "occur")
  ("P" ibuffer-do-print "print")
  ("Q" ibuffer-do-query-replace "query-replace")
  ("R" ibuffer-do-rename-uniquely "rename-uniquely")
  ("T" ibuffer-do-toggle-read-only "toggle-read-only")
  ("U" ibuffer-do-replace-regexp "replace-regexp")
  ("V" ibuffer-do-revert "revert")
  ("W" ibuffer-do-view-and-eval "view-and-eval")
  ("X" ibuffer-do-shell-command-pipe "shell-command-pipe")
  ("b" nil "back"))

(defhydra hydra-ibuffer-sort (:color amaranth :columns 3 :quit-key ("q" "C-g"))
  "Sort"
  ("i" ibuffer-invert-sorting "invert")
  ("a" ibuffer-do-sort-by-alphabetic "alphabetic")
  ("v" ibuffer-do-sort-by-recency "recently used")
  ("s" ibuffer-do-sort-by-size "size")
  ("f" ibuffer-do-sort-by-filename/process "filename")
  ("m" ibuffer-do-sort-by-major-mode "mode")
  ("b" hydra-ibuffer-main/body "back" :color blue))

(defhydra hydra-ibuffer-filter (:color amaranth :columns 4 :quit-key ("q" "C-g"))
  "Filter"
  ("m" ibuffer-filter-by-used-mode "mode")
  ("M" ibuffer-filter-by-derived-mode "derived mode")
  ("n" ibuffer-filter-by-name "name")
  ("c" ibuffer-filter-by-content "content")
  ("e" ibuffer-filter-by-predicate "predicate")
  ("f" ibuffer-filter-by-filename "filename")
  (">" ibuffer-filter-by-size-gt "size")
  ("<" ibuffer-filter-by-size-lt "size")
  ("/" ibuffer-filter-disable "disable")
  ("b" hydra-ibuffer-main/body "back" :color blue))

(defhydra hydra-git-gutter (:body-pre (git-gutter-mode 1)
                            :hint nil :quit-key ("q" "C-g"))
  "
Git gutter:
  _j_: next hunk        _s_tage hunk     _q_uit
  _k_: previous hunk    _r_evert hunk    _Q_uit and deactivate git-gutter
  ^ ^                   _p_opup hunk
  _h_: first hunk
  _l_: last hunk        set start _R_evision
"
  ("j" git-gutter:next-hunk)
  ("k" git-gutter:previous-hunk)
  ("h" (progn (goto-char (point-min))
              (git-gutter:next-hunk 1)))
  ("l" (progn (goto-char (point-min))
              (git-gutter:previous-hunk 1)))
  ("s" git-gutter:stage-hunk)
  ("r" git-gutter:revert-hunk)
  ("p" git-gutter:popup-hunk)
  ("R" git-gutter:set-start-revision)
  ("q" nil :color blue)
  ("Q" (progn (git-gutter-mode -1)
              ;; git-gutter-fringe doesn't seem to
              ;; clear the markup right away
              (sit-for 0.1)
              (git-gutter:clear))
       :color blue))


(defhydra hydra-avy ( :hint nil :quit-key ("q" "C-g"))
  "
     ^Char^            ^other^
-------------------------------------
[_c_]   char         [_w_]   word
[_C_]   char-2       [_s_]   subword
[_t_]   char-timer   [_l_]   line
"
    ("c" avy-goto-char :exit t)
    ("C" avy-goto-char-2 :exit t)
    ("t" avy-goto-char-timer :exit t)
    ("w" avy-goto-word-1 :exit t)
    ("s" avy-goto-subword-1 :exit t)
    ("l" avy-goto-line :exit t))

(defhydra hydra-multiple-cursors (:hint nil :quit-key ("q" "C-g"))
  "
     ^Up^            ^Down^        ^Other^
----------------------------------------------
[_p_]   Next    [_n_]   Next    [_l_] Edit lines
[_P_]   Skip    [_N_]   Skip    [_a_] Mark all
[_M-p_] Unmark  [_M-n_] Unmark  [_r_] Mark by regexp
^ ^             ^ ^             [_#_] mc/insert-numbers
^ ^             ^ ^             [_@_] mc/insert-letters
^ ^             ^ ^             [_]_] mc/vertical-align
^ ^             ^ ^             [_|_] mc/vertical-align-with-space
^ ^             ^ ^             [_q_] Quit
"
  ("l" mc/edit-lines :exit t)
  ("a" mc/mark-all-like-this :exit t)
  ("n" mc/mark-next-like-this)
  ("N" mc/skip-to-next-like-this)
  ("M-n" mc/unmark-next-like-this)
  ("p" mc/mark-previous-like-this)
  ("P" mc/skip-to-previous-like-this)
  ("M-p" mc/unmark-previous-like-this)
  ("r" mc/mark-all-in-region-regexp :exit t)
  ("#" mc/insert-numbers)
  ("@" mc/insert-letters)
  ("|" mc/vertical-align)
  ("]" mc/vertical-align-with-space)
  ("q" nil))

(defhydra hydra-transpose (:color red :quit-key ("q" "C-g"))
  "Transpose"
  ("c" transpose-chars "characters")
  ("w" transpose-words "words")
  ("o" org-transpose-words "Org mode words")
  ("l" transpose-lines "lines")
  ("s" transpose-sentences "sentences")
  ("e" org-transpose-elements "Org mode elements")
  ("p" transpose-paragraphs "paragraphs")
  ("t" org-table-transpose-table-at-point "Org mode table")
  ("q" nil "cancel" :color blue))

(defhydra hydra-launcher (:columns 2 :quit-key ("q" "C-g"))
  "Launch"
  ("m" woman "man")
  ("d" (eww-browse-url "https://www.duckduckgo.com/") "duckduckgo")
  ("f" (call-interactively 'eww-open-file) "eww-open-file")
  ("s" shell "shell")
  ("e" eshell "eshell")
  ("t" scratch "scratch/tmp")
  ("q" nil "cancel"))

(defhydra hydra-learn-sp (:hint nil :quit-key ("q" "C-g"))
         "
  _B_ backward-sexp            -----
  _F_ forward-sexp               _s_ splice-sexp
  _L_ backward-down-sexp         _df_ splice-sexp-killing-forward
  _H_ backward-up-sexp           _db_ splice-sexp-killing-backward
^^------                         _da_ splice-sexp-killing-around
  _k_ down-sexp                -----
  _j_ up-sexp                    _C-s_ select-next-thing-exchange
-^^-----                         _C-p_ select-previous-thing
  _n_ next-sexp                  _C-n_ select-next-thing
  _p_ previous-sexp            -----
  _a_ beginning-of-sexp          _C-f_ forward-symbol
  _z_ end-of-sexp                _C-b_ backward-symbol
--^^-                          -----
  _t_ transpose-sexp             _c_ convolute-sexp
-^^--                            _g_ absorb-sexp
  _x_ delete-char                _q_ emit-sexp
  _dw_ kill-word               -----
  _dd_ kill-sexp                 _,b_ extract-before-sexp
-^^--                            _,a_ extract-after-sexp
  _S_ unwrap-sexp              -----
-^^--                            _AP_ add-to-previous-sexp
  _C-h_ forward-slurp-sexp       _AN_ add-to-next-sexp
  _C-l_ forward-barf-sexp      -----
  _C-S-h_ backward-slurp-sexp    _ join-sexp
  _C-S-l_ backward-barf-sexp     _|_ split-sexp
"
         ;; TODO: Use () and [] - + * | <space>
  ("B" sp-backward-sexp );; similiar to VIM b
  ("F" sp-forward-sexp );; similar to VIM f
  ;;
  ("L" sp-backward-down-sexp )
  ("H" sp-backward-up-sexp )
  ;;
  ("k" sp-down-sexp ) ; root - towards the root
  ("j" sp-up-sexp )
  ;;
  ("n" sp-next-sexp )
  ("p" sp-previous-sexp )
  ;; a..z
  ("a" sp-beginning-of-sexp )
  ("z" sp-end-of-sexp )
  ;;
  ("t" sp-transpose-sexp )
  ;;
  ("x" sp-delete-char )
  ("dw" sp-kill-word )
  ;;("ds" sp-kill-symbol ) ;; Prefer kill-sexp
  ("dd" sp-kill-sexp )
  ;;("yy" sp-copy-sexp ) ;; Don't like it. Pref visual selection
  ;;
  ("S" sp-unwrap-sexp ) ;; Strip!
  ;;("wh" sp-backward-unwrap-sexp ) ;; Too similar to above
  ;;
  ("C-h" sp-forward-slurp-sexp )
  ("C-l" sp-forward-barf-sexp )
  ("C-S-h" sp-backward-slurp-sexp )
  ("C-S-l" sp-backward-barf-sexp )
  ;;
  ;;("C-[" (bind (sp-wrap-with-pair "[")) ) ;;FIXME
  ;;("C-(" (bind (sp-wrap-with-pair "(")) )
  ;;
  ("s" sp-splice-sexp )
  ("df" sp-splice-sexp-killing-forward )
  ("db" sp-splice-sexp-killing-backward )
  ("da" sp-splice-sexp-killing-around )
  ;;
  ("C-s" sp-select-next-thing-exchange )
  ("C-p" sp-select-previous-thing )
  ("C-n" sp-select-next-thing )
  ;;
  ("C-f" sp-forward-symbol )
  ("C-b" sp-backward-symbol )
  ;;
  ;;("C-t" sp-prefix-tag-object)
  ;;("H-p" sp-prefix-pair-object)
  ("c" sp-convolute-sexp )
  ("g" sp-absorb-sexp )
  ("q" sp-emit-sexp )
  ;;
  (",b" sp-extract-before-sexp )
  (",a" sp-extract-after-sexp )
  ;;
  ("AP" sp-add-to-previous-sexp );; Difference to slurp?
  ("AN" sp-add-to-next-sexp )
  ;;
  ("_" sp-join-sexp ) ;;Good
  ("|" sp-split-sexp ))

(defhydra hydra-projectile-other-window (:color teal :quit-key ("q" "C-g"))
  "projectile-other-window"
  ("f"  projectile-find-file-other-window        "file")
  ("g"  projectile-find-file-dwim-other-window   "file dwim")
  ("d"  projectile-find-dir-other-window         "dir")
  ("b"  projectile-switch-to-buffer-other-window "buffer")
  ("q"  nil                                      "cancel" :color blue))

(defhydra hydra-projectile (:color teal
                                     :hint nil :quit-key ("q" "C-g"))
    "
     PROJECTILE: %(projectile-project-root)

     Find File            Search/Tags          Buffers                Cache
------------------------------------------------------------------------------------------
  _F_: file            _a_: ag                _i_: Ibuffer           _c_: cache clear
 _ff_: file dwim       _g_: update gtags      _b_: switch to buffer  _x_: remove known project
 _fd_: file curr dir   _o_: multi-occur     _s-k_: Kill all buffers  _X_: cleanup non-existing
  _r_: recent file                                               ^^^^_z_: cache current
  _d_: dir

"
    ("a"   projectile-ag)
    ("b"   projectile-switch-to-buffer)
    ("c"   projectile-invalidate-cache)
    ("d"   projectile-find-dir)
    ("F"   projectile-find-file)
    ("ff"  projectile-find-file-dwim)
    ("fd"  projectile-find-file-in-directory)
    ("g"   ggtags-update-tags)
    ("s-g" ggtags-update-tags)
    ("i"   projectile-ibuffer)
    ("K"   projectile-kill-buffers)
    ("s-k" projectile-kill-buffers)
    ("m"   projectile-multi-occur)
    ("o"   projectile-multi-occur)
    ("s-p" projectile-switch-project "switch project")
    ("p"   projectile-switch-project)
    ("s"   projectile-switch-project)
    ("r"   projectile-recentf)
    ("x"   projectile-remove-known-project)
    ("X"   projectile-cleanup-known-projects)
    ("z"   projectile-cache-current-file)
    ("`"   hydra-projectile-other-window/body "other window")
    ("q"   nil "cancel" :color blue))



(defhydra hydra-window (:color red
                        :columns nil :quit-key ("q" "C-g"))
  "window"
  ("h" windmove-left nil)
  ("j" windmove-down nil)
  ("k" windmove-up nil)
  ("l" windmove-right nil)
  ("H" hydra-move-splitter-left nil)
  ("J" hydra-move-splitter-down nil)
  ("K" hydra-move-splitter-up nil)
  ("L" hydra-move-splitter-right nil)
  ("v" (lambda ()
         (interactive)
         (split-window-right)
         (windmove-right))
       "vert")
  ("x" (lambda ()
         (interactive)
         (split-window-below)
         (windmove-down))
       "horz")
  ("t" transpose-frame "'" :exit t)
  ("o" delete-other-windows "one" :exit t)
  ("a" ace-window "ace")
  ("s" ace-swap-window "swap")
  ("d" ace-delete-window "del")
  ("i" ace-maximize-window "ace-one" :exit t)
  ("b" ido-switch-buffer "buf")
  ("m" headlong-bookmark-jump "bmk")
  ("q" nil "cancel")
  ("u" (progn (winner-undo) (setq this-command 'winner-undo)) "undo")
  ("f" nil))

(defhydra hydra-move
   (:body-pre (next-line) :quit-key ("q" "C-g"))
   "move"
   ("n" next-line)
   ("p" previous-line)
   ("f" forward-char)
   ("b" backward-char)
   ("a" beginning-of-line)
   ("e" move-end-of-line)
   ("v" scroll-up-command)
   ;; Converting M-v to V here by analogy.
   ("V" scroll-down-command)
   ("l" recenter-top-bottom)
   ("q" nil "exit"))

(defhydra hydra-transpose (:color red :quit-key ("q" "C-g"))
  "Transpose"
  ("c" transpose-chars "characters")
  ("w" transpose-words "words")
  ("o" org-transpose-words "Org mode words")
  ("l" transpose-lines "lines")
  ("s" transpose-sentences "sentences")
  ("e" org-transpose-elements "Org mode elements")
  ("p" transpose-paragraphs "paragraphs")
  ("t" org-table-transpose-table-at-point "Org mode table")
  ("q" nil "cancel" :color blue))

(defun toggle-transparency ()
  (interactive)
  (let ((alpha (frame-parameter nil 'alpha)))
    (set-frame-parameter
     nil 'alpha
     (if (eql (cond ((numberp alpha) alpha)
                    ((numberp (cdr alpha)) (cdr alpha))
                    ;; Also handle undocumented (<active> <inactive>) form.
                    ((numberp (cadr alpha)) (cadr alpha)))
              100)
         '(95 . 95) '(100 . 100)))))

(defun increase-transparency ()
  (interactive)
  (let* ((opacity (or (frame-parameter nil 'alpha) 100))
         (new-opacity (- (car opacity) 5)))
    (set-frame-parameter
     nil 'alpha
     (cons (if (< new-opacity 0) 0 new-opacity) (if (< new-opacity 0) 0 new-opacity)))))



(defun decrease-transparency ()
  (interactive)
  (let* ((opacity (or (frame-parameter nil 'alpha) 100))
        (new-opacity (+ (car opacity) 5)))
    (set-frame-parameter
     nil 'alpha
     (cons (if (> new-opacity 100) 100 new-opacity) (if (> new-opacity 100) 100 new-opacity)))))

(defhydra hydra-transparency (:hint nil :quit-key ("q" "C-g"))
  ("g" increase-transparency "increase")
  ("l" decrease-transparency "decrease")
  ("o" toggle-transparency "toggle")
  ("q" nil "exit"))


(defhydra hydra-dired (:hint nil :color pink :quit-key ("q" "C-g"))
  "
_+_ mkdir          _v_iew           _m_ark             _(_ details        _i_nsert-subdir    wdired
_C_opy             _O_ view other   _U_nmark all       _)_ omit-mode      _$_ hide-subdir    C-x C-q : edit
_D_elete           _o_pen other     _u_nmark           _l_ redisplay      _w_ kill-subdir    C-c C-c : commit
_R_ename           _M_ chmod        _t_oggle           _g_ revert buf     _e_ ediff          C-c ESC : abort
_Y_ rel symlink    _G_ chgrp        _E_xtension mark   _s_ort             _=_ pdiff
_S_ymlink          ^ ^              _F_ind marked      _._ toggle hydra   \\ flyspell
_r_sync            ^ ^              ^ ^                ^ ^                _?_ summary
_z_ compress-file  _A_ find regexp
_Z_ compress       _Q_ repl regexp

T - tag prefix
"
  ("\\" dired-do-ispell)
  ("(" dired-hide-details-mode)
  (")" dired-omit-mode)
  ("+" dired-create-directory)
  ("=" diredp-ediff)         ;; smart diff
  ("?" dired-summary)
  ("$" diredp-hide-subdir-nomove)
  ("A" dired-do-find-regexp)
  ("C" dired-do-copy)        ;; Copy all marked files
  ("D" dired-do-delete)
  ("E" dired-mark-extension)
  ("e" dired-ediff-files)
  ("F" dired-do-find-marked-files)
  ("G" dired-do-chgrp)
  ("g" revert-buffer)        ;; read all directories again (refresh)
  ("i" dired-maybe-insert-subdir)
  ("l" dired-do-redisplay)   ;; relist the marked or singel directory
  ("M" dired-do-chmod)
  ("m" dired-mark)
  ("O" dired-display-file)
  ("o" dired-find-file-other-window)
  ("Q" dired-do-find-regexp-and-replace)
  ("R" dired-do-rename)
  ("r" dired-do-rsynch)
  ("S" dired-do-symlink)
  ("s" dired-sort-toggle-or-edit)
  ("t" dired-toggle-marks)
  ("U" dired-unmark-all-marks)
  ("u" dired-unmark)
  ("v" dired-view-file)      ;; q to exit, s to search, = gets line #
  ("w" dired-kill-subdir)
  ("Y" dired-do-relsymlink)
  ("z" diredp-compress-this-file)
  ("Z" dired-do-compress)
  ("q" nil)
  ("." nil :color blue))

(defhydra hydra-folding (:color red :quit-key ("q" "C-g"))
   "
 Move ^^^^|  open/close^^ |  move by fold ^^^| toggle          ^^^^^^^^
-----^^^^-+------------^^-+---------------^^^+-----------------------^^
  ^_k_^   | _o_pen node   | _n_ext fold     ^|  _f_orward toggle node
_h_ + _l_ | _c_lose node  | _p_revious fold ^|  toggle _a_ll
  ^_j_^   |             ^^|               ^^^|

  "
   ("j" next-line)
   ("k" previous-line)
   ("l" forward-char)
   ("h" backward-char)
   ("o" origami-open-node)
   ("c" origami-close-node)
   ("n" origami-next-fold)
   ("p" origami-previous-fold)
   ("f" origami-forward-toggle-node)
   ("a" origami-toggle-all-nodes))

(defhydra hydra-lsp (:exit t :hint nil :quit-key ("q" "C-g"))
  "
 Buffer^^               Server^^                   Symbol
-------------------------------------------------------------------------------------
 [_f_] format           [_M-r_] restart            [_d_] declaration  [_i_] implementation  [_o_] documentation
 [_m_] imenu            [_S_]   shutdown           [_D_] definition   [_t_] type            [_r_] rename
 [_x_] execute action   [_M-s_] describe session   [_R_] references   [_s_] signature"
  ("d" lsp-find-declaration)
  ("D" lsp-ui-peek-find-definitions)
  ("R" lsp-ui-peek-find-references)
  ("i" lsp-ui-peek-find-implementation)
  ("t" lsp-find-type-definition)
  ("s" lsp-signature-help)
  ("o" lsp-describe-thing-at-point)
  ("r" lsp-rename)

  ("f" lsp-format-buffer)
  ("m" lsp-ui-imenu)
  ("x" lsp-execute-code-action)

  ("M-s" lsp-describe-session)
  ("M-r" lsp-restart-workspace)
  ("S" lsp-shutdown-workspace))

(defhydra hydra-emojify (:hint nil :quit-key ("q" "C-g"))
  ("i" emojify-insert-emoji "insert")
  ("d" emojify-describe-emoji "describe")
  ("l" emojify-list-emojis "list")
  ("q" nil "exit"))


(defhydra hydra-rubysib (:hint nil :quit-key ("q" "C-g"))
  "Seeing is Believing\n"
  ("r" seeing-is-believing-run "SiB-run")
  ("c" seeing-is-believing-clear "SiB-clear")
  ("x" seeing-is-believing-run-as-xmpfilter "SiB-run-as-xmpfilter")
  ("m" seeing-is-believing-mark-current-line-for-xmpfilter "SiB-mark-for-xmpfilter")
  ("q" nil "exit"))

(defhydra hydra-ruby-eval (:hint nil :quit-key ("q" "C-g"))
  "send/eval\n"
  ("l" ruby-send-line "send-line")
  ("r" ruby-send-region "send-region")
  ("b" ruby-send-buffer "send-buffer")
  ("e" ruby-send-block "send-block")
  ("s" hydra-rubysib/body "SiB"  :color blue)
  ("q" nil "exit")
  )

(defhydra hydra-rectangle (:body-pre (rectangle-mark-mode) :post (deactivate-mark) :quit-key ("q" "C-g") :hint nil)
    "
     ^Move^            ^Action^                   ^Misc^
-----------------------------------------------------------------------
[_h_] ← backward-char    [_w_] copy-as-kill     [_e_] exchange
[_j_] ↓  next-line        [_y_] yank             [_N_] number-lines
[_k_] ↑  previous-line    [_t_] string           [_u_] undo
[_l_] → forward-char     [_d_] kill             [_r_] reset
^ ^                       [_c_] clear
^ ^                       [_o_] open
"
    ("h" backward-char)
    ("j" next-line)
    ("k" previous-line)
    ("l" forward-char)
    ("w" copy-rectangle-as-kill) ; C-x r M-w
    ("y" yank-rectangle)         ; C-x r y
    ("t" string-rectangle)     ; C-x r t
    ("d" kill-rectangle)         ; C-x r d
    ("c" clear-rectangle)       ; C-x r c
    ("o" open-rectangle)        ; C-x r o
    ("N" rectangle-number-lines)        ; C-x r N
    ("e" rectangle-exchange-point-and-mark) ; C-x C-x
    ("u" undo)
    ("r" (if (region-active-p)
             (deactivate-mark)
           (rectangle-mark-mode 1)))

    ;; ("q" nil "exit")

  )

(define-prefix-command 'hydra-map)
(global-set-key (kbd "η") 'hydra-map)
(define-key global-map (kbd "η z b") 'hydra-buffer-zoom/body)
(define-key global-map (kbd "η z g") 'hydra-global-zoom/body)
(define-key global-map (kbd "η m") 'hydra-multiple-cursors/body)
(define-key global-map (kbd "η a") 'hydra-avy/body)
(define-key global-map (kbd "η n") 'hydra-move/body)
(define-key global-map (kbd "η r") 'hydra-rectangle/body)
(define-key global-map (kbd "η w") 'hydra-window/body)
(define-key global-map (kbd "η p") 'hydra-projectile/body)
(define-key global-map (kbd "η s") 'hydra-learn-sp/body)
(define-key global-map (kbd "η t") 'hydra-transpose/body)
(define-key global-map (kbd "η l") 'hydra-launcher/body)
(define-key global-map (kbd "η <f4>") 'hydra-transparency/body)
(define-key global-map (kbd "η SPC") (lambda ()
                                           (interactive)
                                           (insert-char (string-to-char "η"))))
(define-key global-map (kbd "η x")  (lambda ()
                                      (interactive)
                                      (counsel-M-x "^hydra")))
