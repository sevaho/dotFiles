# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

export TMOUT=5600
export TERM="screen-256color"
ZSH_THEME="powerline"

ENABLE_CORRECTION="true"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

#alias

alias ll="ls -latr"
alias gpom="git push origin master"
alias gits="git status"
alias docka="sudo docker run --rm -it alpine sh"
alias temp='cat /sys/bus/acpi/drivers/thermal/LNXTHERM\:00/thermal_zone/temp'


#powerline

POWERLINE_RIGHT_A="mixed"
POWERLINE_HIDE_USER_NAME="true"
POWERLINE_SHORT_HOST_NAME="true"
POWERLINE_GIT_CLEAN="✔"
POWERLINE_GIT_DIRTY="✘"
POWERLINE_GIT_ADDED=red
POWERLINE_GIT_MODIFIED=red
POWERLINE_GIT_DELETED=red
POWERLINE_GIT_UNTRACKED=red
POWERLINE_GIT_RENAMED="➜"
POWERLINE_GIT_UNMERGED="═"
POWERLINE_RIGHT_A="date"

export PATH=~/scripts:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/root/.vimpkg/bin:~/.vimpkg/bin
