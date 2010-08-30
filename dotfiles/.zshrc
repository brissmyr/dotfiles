export MANPATH=$HOME/install/share/man/:$MANPATH
export PYTHONPATH=$HOME/install/lib/python:$PYTHONPATH
#export PS1="\e[1m\w$\e[m "
export PS1=$'%{\e[1;31m%}%n@%m%{\e[0m%}:%B%~/%b >%# '
export PROMPT_COMMAND='echo -ne "\033]0;${PWD##*/}\007"'
export EDITOR="emacs"

# To be able to run commands copied from verification_points.sh
export util_dir=/work/svndev/project/mve6/test/system/out/util-linux64/

#export HISTCONTROL=erasedups    # no duplicate entries
#export HISTSIZE=100000          # big big history
#shopt -s histappend             # append to history, don't overwrite it
#export PROMPT_COMMAND="history -a; history -r; $PROMPT_COMMAND"

# Run on FPGA
module load gnu/gcc-arm/4.2.0
export STYX3_AVESW_PATH=$HOME/svndev/project/linux
export ARGUS_IPADDR=10.44.10.156
export ARGUS_MACADDR=00c0daa19ab7
export ARGUS_DEFAULT_GW=10.44.0.1 # ???
export HOME_SAMBA_IPADDR=10.44.10.120 # smil

alias index='find -name "*.[chxsS]" -print > cscope.files'
alias make="$HOME/bin/pretty_make.py"
alias diff="$HOME/install/bin/colordiff.pl"
# User specific aliases and functions

alias l='ls -UhXBl'

function svndiff () { svn diff --diff-cmd=diff -x "-w -U1000" $@ | kompare -o - 2>&1; }
function svndiffc () { svn diff | diff }

autoload -U compinit
compinit

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.history
setopt APPEND_HISTORY
#for sharing history between zsh processes
setopt INC_APPEND_HISTORY

#global aliases, use with e.g. cd ....
alias -g '...'='../..'
alias -g '....'='../../..'
alias -g '.....'='../../../..'

WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

#precmd () {print -Pn "\e]0;%n@%m: %~\a"}
precmd () {print -Pn "\e]0;%n@%m\a"}
