#!/bin/sh
~/.fehbg
setxkbmap -option ctrl:nocaps
xrdb .Xresources

nm-applet &
mopidy &

export _JAVA_AWT_WM_NONREPARENTING=1
exec herbstluftwm
