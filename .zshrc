#exports
export ZSH=~/.oh-my-zsh
export TMOUT=5600
export TERM="screen-256color"
export PAGER=less
export PATH=~/scripts:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/root/.vimpkg/bin:~/.vimpkg/bin

#options
ENABLE_CORRECTION="true"
setopt AUTO_CD
setopt NO_BEEP
setopt NO_CASE_GLOB
setopt EXTENDED_GLOB

#ohmyzsh
ZSH_THEME="agnoster"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

#alias
alias ll='ls -latr'
alias gpom="git push origin master"
alias gits="git status"
alias docka="sudo docker run --rm -it alpine sh"
alias temp='cat /sys/bus/acpi/drivers/thermal/LNXTHERM\:00/thermal_zone/temp'
alias du='du -sh *' 
alias df='df -kTh'
alias tree='tree -Csuh'
alias xs='cd'
alias vf='cd'
alias moer='more'
alias moew='more'
alias kk='ll'
alias more='less'
alias bat='acpi -b | cut -d " " -f4,5 | sed 's/,//''

#Protect root
if [ "$(id -ru)" -eq "0"  ]; then
  alias rm='rm --interactive=once'
  alias cp='cp --interactive=once'
  alias mv='mv --interactive=once'
else
  alias cp='cp -r'
fi

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

#vim default
export EDITOR="vim"

