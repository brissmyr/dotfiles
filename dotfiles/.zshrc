#export PS1="\e[1m\w$\e[m "
export PS1=$'%{\e[1;31m%}%n@%m%{\e[0m%}:%B%~/%b >%# '
export PROMPT_COMMAND='echo -ne "\033]0;${PWD##*/}\007"'
export EDITOR="emacs"
export PATH="$HOME/bin:/opt/local/bin:/opt/local/sbin:$PATH"

#alias l='ls -UhXBl'
# Mac
alias l='ls -UhBlG'
alias ls='ls -G'

#function svndiff () { svn diff --diff-cmd=diff -x "-w -U1000" $@ | kompare -o - 2>&1; }
function gitdiff () { git diff $@ | colordiff.pl }

autoload -U compinit
compinit

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.history
setopt APPEND_HISTORY
#for sharing history between zsh processes
setopt INC_APPEND_HISTORY

alias -g '...'='../..'
alias -g '....'='../../..'
alias -g '.....'='../../../..'

WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

precmd () {print -Pn "\e]0;%n@%m\a"}
