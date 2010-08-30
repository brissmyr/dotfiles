#source /arm/tools/setup/init/bash
source /arm/tools/setup/init/bash.d/modules-init

export SVNROOT=http://lun-svn1.lund.arm.com/svn/mpd/video

module load swdev
module load arm/cluster
module load util

module load tigris/subversion/1.6.2
module load gnu/gcc/4.1.2
module load gnu/make/3.81
module load arm/rascdevkit/1.1.3
module load python/python-test/2.5.1
module load gnu/valgrind/3.4.1
module load gnu/gnuplot/4.2.5
module load swig/swig/1.3.40

module load core
module load eda
module load sysadm
module load syslib
module load mentor/modelsim/6.6a
module load synplicity/synplify/9.2.2
module load xilinx/ise/11.1
export MTI=${MODELTECH_HOME}

export PATH=/work/svndev/project/mve6/test/system/out/util-linux64:$HOME/bin:$HOME/install/bin:$HOME/install/sbin:$HOME/svndev/asic/util/i686-linux:$PATH
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

export TEST_SUITES=/scratch/test_ave6/buildbots/mali-ve6_linux64_slave/mali-ve6_linux64_slave/project/mve_test/test_suites/
export MVE_TEST=~/svndev/project/mve_test
export MVE6=~/svndev/project/mve6
export SYSTEM=~/svndev/project/mve6/test/system
export LOGS=/scratch/test_ave6/buildbots/mali-ve6_regress-on-commit-cluster_slave/mali-ve6_regress-on-commit-cluster_slave/project/mve6/regress-on-commit/logs/

alias boot_fpga="$SYSTEM/out/host-styx3/ethboot -s -v $SYSTEM/out/host-styx3/prog.bin"
alias index='find -name "*.[chxsS]" -print > cscope.files'
alias make="$HOME/bin/pretty_make.py"
alias diff="$HOME/install/bin/colordiff.pl"
# User specific aliases and functions

alias bsub_i='bsub -Is -P PR418' # -R "linux && intel && os64"'
alias bsub_j='bsub -J my_job -P PR418 -R "linux && intel && os64" -o my_job.log'
alias bkill_all='bkill -u johbri01 0'
alias l='ls -UhXBl'

#function svndiff () { svn diff --diff-cmd=diff -x "-w -U1000" $@ | kompare -o - 2>&1; }
function svndiffc () { svn diff | diff }
function runinfo () { find $1 -maxdepth 2 -name "run_info" | xargs ls -t | xargs grep tcsuite; }
function errors () { find $1 -name verify.err -exec grep -H -i $2 {} \; | sort; }

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
