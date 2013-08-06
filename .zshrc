ZSH=$HOME/.oh-my-zsh
ZSH_THEME="alanpeabody"

plugins=(git bundler brew gem rbates)

source $ZSH/oh-my-zsh.sh

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.history
setopt APPEND_HISTORY
#for sharing history between zsh processes
setopt INC_APPEND_HISTORY

WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
