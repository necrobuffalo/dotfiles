# The following lines were added by compinstall
zstyle :compinstall filename '/Users/embarber/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

#################
# SHELL OPTIONS #
#################
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
setopt prompt_subst

#########################
# ENVIRONMENT VARIABLES #
#########################
export EDITOR=vim
export GOPATH=~/go
export PAGER=less
export PATH=~/bin:~/go/bin:${PATH}
export WORKON_HOME=~/envs

############
# VCS_INFO #
############
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git hg
zstyle ':vcs_info:*' actionformats \
    '(%b|%a)'
zstyle ':vcs_info:*' formats       \
    '(%b)'
precmd_vcs_info () { vcs_info }
precmd_functions+=( precmd_vcs_info )

##########
# PROMPT #
##########
PROMPT="%(?.%F{green}.%F{red})[%D{%I:%M:%S %p}]%f %F{red}%m%f:%F{cyan}%~%f \${vcs_info_msg_0_}
%# "
RPROMPT="%(?..:()"

###########
# ALIASES #
###########
# Fancy colors
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
if [[ $(uname) == 'Darwin' ]]; then
    alias ls='ls -G'
else
    alias ls='ls --color=auto'
fi

# QOL
alias which='whence -a'
alias e='emacsclient -nw'
alias emacs='emacs -nw'

#############
# FUNCTIONS #
#############
weather () {
    curl wttr.in/${1:-pdx}
}

##########
# EXTRAS #
##########
[[ -f /usr/local/bin/virtualenvwrapper.sh ]] && . /usr/local/bin/virtualenvwrapper.sh
[[ -f ~/.wechallrc ]] && . ~/.wechallrc
[[ -f ~/.openrc ]] && . ~/.openrc
# Source machine-specific configuration.
[[ -f ~/.localrc ]] && . ~/.localrc
