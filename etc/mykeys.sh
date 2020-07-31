#!/bin/sh
#
#
# Executed by startx (run your window manager from here)

xmodmap .Xmodmap && ps aux | grep -i '[x]cape' && killall -9 xcape; hash xcape 2>&1 >/dev/null && xcape -e 'Mode_switch=semicolon;Shift_L=Escape;Shift_R=Escape'  &
