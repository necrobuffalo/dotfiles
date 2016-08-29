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

# wechall creds
[[ -f ~/.wechallrc ]] && source ~/.wechallrc
# openstack credentials
[[ -f ~/.openrc ]] && source ~/.openrc
# this needs to set manpath eventually, but it breaks in unexpected ways
[[ -d /cat ]] && export PATH=/cat/bin:${PATH}

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
