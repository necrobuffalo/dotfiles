#!/bin/bash
echo $(date +"%a %b %d, %H:%M %Z") -\
    $(date -u +"%H:%M %Z") -\
    $(TZ='Europe/Berlin' date +"%H:%M %Z")
