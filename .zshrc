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

###############################################################################
# COLOURS
###############################################################################
# Set TERM first if on solaris
[[ `uname` == "SunOS" ]] && [[ $TERM == "screen-256color" ]] && export TERM=screen
[[ `uname` == "SunOS" ]] && [[ $TERM == "rxvt-unicode-256color" ]] && export TERM=rxvt-256color

setopt prompt_subst
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
PROMPT="┌ %(?..%?)%B%F${PR_GREEN}%n${PR_NO_COLOUR}%f%b@%m:%~
└─ %# "
RPROMPT="%(?..:()"

# Set preferred programs for paging and editing
EDITOR=vim
PAGER=less

[[ `uname` == "SunOS" ]] && export PATH=/opt/csw/bin:${PATH} && export PAGER=$(which less)

###############################################################################
# ENVIRONMENT-SPECIFIC OPTIONS
###############################################################################
# Set up virtualenvwrapper if available
if [[ -e /usr/bin/virtualenvwrapper.sh ]] ; then
    export WORKON_HOME=~/.virtualenvs
    source /usr/bin/virtualenvwrapper.sh
fi
# Set up git highlighting, etc.
if [[ -e /usr/share/git/completion/git-prompt.sh ]] ; then
    source /usr/share/git/completion/git-prompt.sh
fi

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
# Source all related files
for r in $HOME/.zsh/*.zsh; do
    if [[ $DEBUG > 0 ]]; then
       echo "zsh: sourcing $r"
    fi
    source $r
done
