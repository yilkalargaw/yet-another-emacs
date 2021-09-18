#!/usr/bin/bash
emacs --batch --eval "(require 'org)" --eval '(org-babel-tangle-file "./myinit.org")'
emacs &
