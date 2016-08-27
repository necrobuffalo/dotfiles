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

PROMPT="%B%1F%m%f:%6F%~ %1F%#%f%b "

#########################
# Environment variables #
#########################
export EDITOR=vim
export PAGER=less
export PATH=/cat/bin:~/go/bin:~/bin:${PATH}
export GOPATH=~/go

###########
# Aliases #
###########
# Derp
alias derp='sudo /usr/sbin/wicked ifdown wlp2s0 && sudo /usr/sbin/wicked ifup wlp2s0'
alias fucking='sudo'
alias fetch='screenfetch -c 4,7 -d "-cpu"'
alias reboot='/sbin/reboot'         # I don't actually want /sbin in my path
alias shutdown='/sbin/shutdown now' # but less typing is still nice
alias sl='ls --color=auto'
alias emacs='emacs -nw'             # if I'm starting emacs from bash, I wanna use the terminal version

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
alias which='whence -a'
alias mute='pactl set-sink-mute 1 toggle'
alias vu='pactl set-sink-volume 1 +10%'
alias vd='pactl set-sink-volume 1 -10%'

alias sockscat='ssh -D 1080 destiny'

#############
# Functions #
#############
weather() {
    curl wttr.in/pdx
}

#######################
# Do openstack things #
#######################
[[ -f ~/.openrc ]] && source ~/.openrc
