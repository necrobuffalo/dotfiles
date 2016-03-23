#!/bin/sh
~/.fehbg
setxkbmap -option ctrl:nocaps

#light-locker --no-late-locking --lock-on-suspend
xscreensaver -no-splash &
trayer --heighttype pixel --height 18 --SetPartialStrut true &
nm-applet &
mopidy &

xmonad
