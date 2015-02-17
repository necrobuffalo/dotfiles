#!/bin/bash

title=$(playerctl metadata title 2>/dev/null)
artist=$(playerctl metadata artist 2>/dev/null)

if [ -z $title ] ; then
    echo "♫ Not playing"
    exit
else
    echo "♫ ${title} - ${artist}"
fi
