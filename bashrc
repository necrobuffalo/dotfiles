#!/usr/bin/bash

#######################
# Shell configuration #
#######################
PS1="\h:\W \u\$ "

#########################
# Environment variables #
#########################
export EDITOR=/usr/local/bin/vim
export GOPATH=~/go
export LESSHISTFILE=/dev/null
export PAGER=less
export PATH=~/go/bin:~/bin:${PATH}

###########
# Aliases #
###########
alias grep='grep --color=auto'
alias ls='ls -G'

[[ -f ~/.wechallrc ]] && source ~/.wechallrc
[[ -f ~/.openrc ]] && source ~/.openrc
