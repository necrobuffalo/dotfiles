# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/taron/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

############################################################
# GENERAL OPTIONS
############################################################

# Set up virtualenvwrapper
export WORKON_HOME=~/.virtualenvs
source /usr/bin/virtualenvwrapper.sh
# Set up git highlighting, etc.
source /usr/share/git/completion/git-prompt.sh

# Prompt
PROMPT="┌ %(?..%?)%B%F{green}%n%f%b@%m:%~
└─ %# "
RPROMPT="%(?..:()"

EDITOR=vim

PATH=~/bin:$PATH

############################################################
# SOLARIS COMPATIBILITY
############################################################
if `uname | grep -i SunOS > /dev/null`; then
    if $(echo ${TERM} | grep screen > /dev/null); then
        export TERM=screen
    elif $(echo ${TERM} | grep rxvt-unicode > /dev/null); then
        export TERM=rxvt-256color
    fi

    export PATH=/opt/csw/bin:${PATH}
fi

############################################################
# ADDITIONAL FILES
############################################################

fpath=(~/.zsh $fpath)
# Source all related files
for r in $HOME/.zsh/*.zsh; do
    if [[ $DEBUG > 0 ]]; then
       echo "zsh: sourcing $r"
    fi
    source $r
done
