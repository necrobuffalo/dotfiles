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

# No idea what this does
fpath=(~/.zsh $fpath)

for r in $HOME/.zsh/*.zsh; do
    if [[ $DEBUG > 0 ]]; then
       echo "zsh: sourcing $r"
    fi
    source $r
done
