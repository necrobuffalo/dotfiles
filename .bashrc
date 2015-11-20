#!/usr/bin/bash

#######################
# Shell configuration #
#######################
PS1="$(tput setaf 10)\u $(tput setaf 6)on \h $(tput setaf 11)at \w$(tput sgr0)
\$ "

#########################
# Environment variables #
#########################
export EDITOR=vim
export PAGER=less
export PATH=~/bin:${PATH}

###########
# Aliases #
###########
# Derp
alias derp='sudo /usr/sbin/wicked ifdown wlp2s0 && sudo /usr/sbin/wicked ifup wlp2s0'
alias fucking='sudo'
alias reboot='/sbin/reboot'         # I don't actually want /sbin in my path
alias shutdown='/sbin/shutdown now' # but less typing is still nice
alias sl='ls --color=auto'

# Colors
alias grep='grep --color=auto'
alias ls='ls --color=auto'

# Short forms
alias j='journalctl'
alias s='systemctl'
alias z='zypper'
alias zdup='sudo zypper dup'
alias zin='sudo zypper install'
alias zref='sudo zypper refresh'
alias zs='zypper search'
alias zup='sudo zypper dup' # can't stop on this release, this is bat country!

# Quality of life improvements
alias uskb='setxkbmap -layout us -option ctrl:nocaps'
alias intlkb='setxkbmap -layout us -variant intl -option ctrl:nocaps'
alias mute='pactl set-sink-mute 1 toggle'
alias vu='pactl set-sink-volume 1 +10%'
alias vd='pactl set-sink-volume 1 -10%'

alias sockscat='ssh -D 1080 destiny'

#############
# Functions #
#############
__weather_general() {
    WEATHER=$(curl -s "http://api.openweathermap.org/data/2.5/weather?id=${1}&units=imperial")
    WEATHER=$(echo ${WEATHER} | grep -oP '"temp":[\.\d]*' | sed 's/"temp"://')
    echo It is currently ${WEATHER}F in ${2}.
}
__pdx_weather() {
    __weather_general 5746545 Portland
}
__corvallis_weather() {
    __weather_general 5720727 Corvallis
}
weather() {
    case "${1}" in
        pdx|portland)
            __pdx_weather
            ;;
        home)
            __corvallis_weather
            ;;
        *)
            __pdx_weather
    esac
}

#######################
# Do openstack things #
#######################
[[ -f ~/.openrc ]] && source ~/.openrc
