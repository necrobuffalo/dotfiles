#!/usr/bin/zsh

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

setopt prompt_subst
setopt appendhistory

###############################################################################
# COLOURS
###############################################################################
# Set TERM first if on solaris
[[ `uname` == "SunOS" ]] && [[ $TERM == "screen-256color" ]] && export TERM=screen
[[ `uname` == "SunOS" ]] && [[ $TERM == "rxvt-unicode-256color" ]] && export TERM=rxvt-256color

autoload colors zsh/terminfo
if [[ "$terminfo[colors]" -ge 8 ]]; then
    colors
fi
for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
    eval PR_$color='%{$terminfo[bold]$fg[${(L)color}]%}'
    eval PR_LIGHT_$color='%{$fg[${(L)color}]%}'
    (( count = $count + 1 ))
done
PR_NO_COLOUR="%{$terminfo[sgr0]%}"

###############################################################################
# VARIABLES
###############################################################################
# Prompt
PROMPT="%(?..%?)%B%F${PR_RED}%n${PR_NO_COLOUR}%f%b@%m:%~
%# "
RPROMPT="%(?..:()"

# Set preferred programs for paging and editing
export EDITOR=vim
export PAGER=less

export XKBOPTIONS="ctrl:nocaps"

[[ `uname` == "SunOS" ]] && export PATH=/opt/csw/bin:${PATH} && export PAGER=$(which less)

# Extra go bits
export GOPATH=~/go
export PATH=${PATH}:~/go/bin

###############################################################################
# ENVIRONMENT-SPECIFIC OPTIONS
###############################################################################
# Set up virtualenvwrapper if available
if [[ -e /usr/bin/virtualenvwrapper.sh ]] ; then
    export WORKON_HOME=~/.virtualenvs
    source /usr/bin/virtualenvwrapper.sh
fi
# Set up git highlighting, etc.
source ~/.git-prompt.sh

# CAT-specific options
if [[ -d /cat ]]; then
    export PATH=/cat/bin:${PATH}
    [[ `uname` == "Linux" ]] && export MANPATH=/cat/man:$(man -w)
    [[ `uname` == "SunOS" ]] && export MANPATH=/cat/man:/usr/share/man
fi

# Prioritize binaries in homedir regardless of environment
PATH=~/bin:${PATH}

###############################################################################
# ADDITIONAL FILES
###############################################################################
fpath=(~/.zsh $fpath)

if [[ -f ~/.openrc ]] ; then
    source .openrc
fi

# Source all related files
for r in $HOME/.zsh/*.zsh; do
    if [[ $DEBUG > 0 ]]; then
       echo "zsh: sourcing $r"
    fi
    source $r
done

###############################################################################
# "MOTD"
###############################################################################

