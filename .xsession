#!/bin/sh
~/.fehbg
setxkbmap -option ctrl:nocaps

xscreensaver -no-splash &
# trayer --heighttype pixel --height 18 --SetPartialStrut true &
# nm-applet &
mopidy &

spectrwm
