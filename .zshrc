#!/usr/bin/zsh

# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored
zstyle :compinstall filename '/home/taron/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

###############
# Zsh modules #
###############
# This seems to be loaded by default in Arch and is a candidate for removal.
autoload -Uz colors && colors

#######################
# Shell configuration #
#######################
setopt append_history
HISTSIZE=1000
SAVEHIST=1000

PROMPT="%10F%m%f %(?..%1F%?%f )%# "
RPROMPT="[%6F%~%f]"

#########################
# Environment variables #
#########################
export EDITOR=vim
export PAGER=less
export PATH=~/bin:${PATH}

###########
# Aliases #
###########
# Colors
alias grep='grep --color=auto'
alias ls='ls --color=auto'

# Short forms
alias j='journalctl'
alias p='pacman'
alias s='systemctl'
alias wcr='sudo wpa_cli reassociate'
alias y='yaourt'

# Quality of life improvements
alias which='whence -a'
alias mute='pactl set-sink-mute 1 toggle'
alias vu='pactl set-sink-volume 1 +10%'
alias vd='pactl set-sink-volume 1 -10%'

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
