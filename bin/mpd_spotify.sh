#!/bin/bash

title=$(playerctl metadata title)
artist=$(playerctl metadata artist)

if [ -z $title ] ; then
    echo "♫ Not playing"
    exit
else
    echo "♫ ${title} - ${artist}"
fi
