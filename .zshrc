# Path to your oh-my-zsh installation.
  export ZSH=/home/sevaho/.oh-my-zsh

export TMOUT=2000
ZSH_THEME="powerline"

source /home/sevaho/powerline.zsh


ENABLE_CORRECTION="true"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

#aliases

alias ll="ls -latr"
alias gpom="git push origin master"
alias gitquick="git add .; git commit -m 'git automatic quick push'; git push origin master"

alias docka="sudo docker run --rm -it alpine sh"
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

export PATH=/home/sevaho/scripts:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/root/.vimpkg/bin:/home/sevaho/.vimpkg/bin
