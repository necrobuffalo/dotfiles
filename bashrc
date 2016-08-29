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
alias ls='ls --color=auto'

[[ -f ~/.wechallrc ]] && source ~/.wechallrc
[[ -f ~/.openrc ]] && source ~/.openrc

# laptop
if [[ $(uname) == 'Darwin' ]]; then
	alias ls='ls -G'
fi
# chandra/cepheus
if [[ $(uname) == 'SunOS' ]]; then
	[[ $TERM == 'xterm-256color' ]] && export TERM=xterm
	[[ $TERM == 'screen-256color' ]] && export TERM=screen
	alias grep='ggrep --color=auto'
	alias ls='gls --color=auto'
fi
