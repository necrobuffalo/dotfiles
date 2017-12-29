zmodload zsh/zprof
# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' list-colors ''
zstyle :compinstall filename '/home/taron/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

#################
# SHELL OPTIONS #
#################
HISTFILE=~/.histfile  # path to where to put the history file
HISTSIZE=1000         # lines to save in history in memory
SAVEHIST=1000         # lines to save in history on disk
bindkey -e            # use emacs keybindings, rather than vim
setopt prompt_subst   # expand variables in prompt

####################
# DEFAULT PROGRAMS #
####################
export EDITOR=vim
export PAGER=less
export BROWSER=firefox

#########################
# ENVIRONMENT VARIABLES #
#########################
export GOPATH=~/go
# python is in a weird place if using homebrew
[[ $(uname) == 'Darwin' ]] && export PATH=/usr/local/opt/python/libexec/bin:${PATH}
export PATH=~/bin:~/go/bin:${PATH}
export WORKON_HOME=~/.venvs

############
# VCS_INFO #
############
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git hg
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' actionformats \
    '(%b|%a) %u|%c'
zstyle ':vcs_info:*' formats       \
    '(%b) %F{red}%u%F{green}%c%f'
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
# Output highlighting
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
alias tf='terraform'

# editors
alias e='emacsclient -nw'
alias emacs='emacs -nw'

# typos
alias pamcan='pacman'

# config files
#alias -g zshrc=$HOME/.zshrc
#alias -g vimrc=$HOME/.vimrc

#############
# FUNCTIONS #
#############
weather () {
    curl wttr.in/${1:-pdx}
}
flushcache () {
    if [[ -f /usr/bin/dscacheutil ]]; then
        sudo /usr/bin/dscacheutil -flushcache
    else
        service nscd restart
    fi
}

##########
# EXTRAS #
##########
if [[ -f /usr/local/bin/virtualenvwrapper.sh ]]; then
    . /usr/local/bin/virtualenvwrapper.sh
elif [[ -f /usr/share/virtualenvwrapper/virtualenvwrapper.sh ]]; then
    . /usr/share/virtualenvwrapper/virtualenvwrapper.sh
fi
[[ -f ~/.wechallrc ]] && . ~/.wechallrc
[[ -f /usr/local/etc/profile.d/z.sh ]] && . /usr/local/etc/profile.d/z.sh
# Source machine-specific configuration.
[[ -f ~/.localrc ]] && . ~/.localrc

# Squash any nonzero return from sourcing stuff (localrc might not exist)
true
