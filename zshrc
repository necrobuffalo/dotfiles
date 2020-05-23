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
setopt HIST_IGNORE_ALL_DUPS
setopt prompt_subst   # expand variables in prompt

####################
# DEFAULT PROGRAMS #
####################
export EDITOR='code -w'  # default editor
# command for emacsclient to run if unable to contact the server.
# leaving this empty should force it to start a new server.
# https://www.gnu.org/software/emacs/manual/html_node/emacs/emacsclient-Options.html
export ALTERNATE_EDITOR=''
export PAGER=less
export BROWSER=firefox

#########################
# ENVIRONMENT VARIABLES #
#########################
export GOPATH=~/go
# python is in a weird place if using homebrew
[[ $(uname) == 'Darwin' ]] && export PATH=/usr/local/opt/python/libexec/bin:${PATH}
export PATH=~/bin:~/.fzf/bin:~/go/bin:~/.gem/ruby/2.5.0/bin:~/.local/bin:${PATH}
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
# rprompt makes copying out of the terminal weird
#RPROMPT="%(?..:()"
RPROMPT=""

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
    alias sl='ls -G'
else
    alias ls='ls --color=auto'
    alias sl='ls --color=auto'
fi

# QOL
alias ne='nix-env'
alias tf='terraform'
alias which='whence -a'

# git
alias ga='git add'
alias gc='git commit'
alias gco='git checkout'

# editors
if which nvim >/dev/null; then
    alias vim='nvim'
fi
# -n to prevent emacsclient from blocking, unless we're calling it from sudoedit etc.
alias e='emacsclient -n'
alias emacs='emacs -n'

# typos
alias pamcan='pacman'

# named directories
#alias -g zshrc=$HOME/.zshrc
#alias -g vimrc=$HOME/.vimrc

alias nvimrc='nvim $HOME/.config/nvim/init.vim'

#############
# FUNCTIONS #
#############
weather () {
    curl wttr.in/${1:-pdx}
}
flushcache () {
    # flush dns cache
    if [[ -f /usr/bin/dscacheutil ]]; then
        # macos
        # might be out of date, see
        # https://help.dreamhost.com/hc/en-us/articles/214981288-Flushing-your-DNS-cache-in-Mac-OS-X-and-Linux
        sudo /usr/bin/dscacheutil -flushcache
    else
        # linux
        service nscd restart
    fi
    # windows: ipconfig /flushdns
}
clear_pyc () {
    find $1 -name '*.pyc' -delete -print
}

############
# AUTOJUMP #
############
# prefer fasd on nixos, fall back to z if needed
if which fasd >/dev/null; then
    eval "$(fasd --init auto)"
else
    [[ -f /usr/local/etc/profile.d/z.sh ]] && . /usr/local/etc/profile.d/z.sh
    [[ -f ~/src/z/z.sh ]] && . ~/src/z/z.sh
fi

##########
# EXTRAS #
##########
if [[ -f /usr/local/bin/virtualenvwrapper.sh ]]; then
    . /usr/local/bin/virtualenvwrapper.sh
elif [[ -f /usr/share/virtualenvwrapper/virtualenvwrapper.sh ]]; then
    . /usr/share/virtualenvwrapper/virtualenvwrapper.sh
fi
[[ -f ~/.wechallrc ]] && . ~/.wechallrc
[[ -f ~/.fzf.zsh ]] && . ~/.fzf.zsh

# Source machine-specific configuration.
[[ -f ~/.localrc ]] && . ~/.localrc

# Squash any nonzero return from sourcing stuff (localrc might not exist)
true
