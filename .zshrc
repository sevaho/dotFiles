# -----------------------------------------------------------------------------------------------------------------------------
# BANNER
# -----------------------------------------------------------------------------------------------------------------------------

banner_info () {
    DISTRO=$(cat /etc/*release* | grep -oP 'NAME="\K[^"]+' | head -n1)
    KERNEL=$(uname -r)
    HOSTNAME=$(hostname)
    CPU=$(awk 'BEGIN{FS=":"} /model name/ { print $2; exit }' /proc/cpuinfo | awk 'BEGIN{FS=" @"; OFS="\n"} { print $1; exit }')
    MEM=$(free -h | grep -v Swap)

    printf "\x1b[36;1m" # blue
    echo "#############################################################################################"
    echo ""
    printf "\x1b[32;1m" # green
    echo "\t\t\tWelcome to $HOSTNAME"
    printf "\x1b[36;1m" # blue
    echo ""
    echo "Distro: $DISTRO && Kernel: $KERNEL"
    echo ""
    echo "Cpu: $CPU"
    echo "$MEM"
    echo "#############################################################################################"
    printf "\x1b[38;0m" # normal
}

if [[ -n "$SSH_CONNECTION" ]] ; then
    banner_info
elif [[ $TTY == "/dev/tty1" ]]; then
    banner_info

    # just unlock a password to trigger gpg agen
    gopass show websites/foo/bar
fi

# -----------------------------------------------------------------------------------------------------------------------------
# KEYBINDS
# -----------------------------------------------------------------------------------------------------------------------------

# For Control k and j
bindkey '^k' up-line-or-history
bindkey '^j' down-line-or-history
bindkey '^l' end-of-line
bindkey '^h' beginning-of-line

# -----------------------------------------------------------------------------------------------------------------------------
# EXPORTS
# -----------------------------------------------------------------------------------------------------------------------------

alias -g G=' | grep'

export NVM_DIR="$HOME/.nvm"
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'
export TMOUT=9600
export READER="zathura"
export PYTHON_KEYRING_BACKEND=keyring.backends.fail.Keyring
export EDITOR=nvim
export ZOXIDE_CMD_OVERRIDE="cd"


export OPENER=xdg-open

# -----------------------------------------------------------------------------------------------------------------------------
# GENERAL
# -----------------------------------------------------------------------------------------------------------------------------

HISTSIZE=10000000
SAVEHIST=10000000

ENABLE_CORRECTION="true"

setopt HIST_IGNORE_ALL_DUPS # ignore duplicated commands history list
setopt SHARE_HISTORY # share command history data
setopt AUTO_CD
setopt NO_BEEP
setopt NO_CASE_GLOB
setopt EXTENDED_GLOB

export PATH=$PATH:/home/sevaho/scripts
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# -----------------------------------------------------------------------------------------------------------------------------
# ZSH AND OHMYZSH
# -----------------------------------------------------------------------------------------------------------------------------

fpath+=~/.zfunc
export fpath=($HOME/.zsh-completions $fpath)

export ZSHRC=~/.zshrc
export ZSH=~/.oh-my-zsh
ZSH_THEME="powerzeesh"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-lazyload qrcode vi-mode zoxide)
source $ZSH/oh-my-zsh.sh

# -----------------------------------------------------------------------------------------------------------------------------
# ALIASES
# -----------------------------------------------------------------------------------------------------------------------------

alias vim='nvim'
alias v='nvim'
alias z='cdi'

# ----------------------
# FAVOURITE APPLICATIONS
# ----------------------

alias pdf='zathura'
alias r='ranger'
alias o='cd /run/media/$USER/'
alias p="python"
alias k="kubectl"
# alias z='zathura'
alias x='nix-shell --command zsh'
alias xpo='nix-shell --command "zsh -c poetry shell"'
alias pdfedit='xournalpp'

# python
alias p_clean="find . | grep -E '(__pycache__|\.pyc|\.pyo$|\.mypy_cache|\.pytest_cache|\.tox|\.egg-info)' | xargs rm -rf"
alias pos="poetry shell"

alias password16="cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 16 | head -n 1 | xsel -b"
alias password32="cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1 | xsel -b"
alias password64="cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 64 | head -n 1 | xsel -b"
alias pass="gopass"
alias gpom="git push origin master"
alias gits="git status"
alias gc="git checkout"
alias gr="git show-ref"
alias gp="git pull"
alias gP="git push"
alias gda="git diff -a"
alias gmd="git merge dev"
alias gms="git merge staging"
alias tiga="tig --all"
alias temp='cat /sys/bus/acpi/drivers/thermal/LNXTHERM\:00/thermal_zone/temp'
alias du='du -sh *'
alias df='df -kTh'
alias lg='lazygit'
alias tree='tree -Csuh'
alias xs='cd'
alias moer='more'
alias moew='more'
alias kk='kubectl krew'
alias more='less'
alias L='less'
alias music='echo "press enter to play" && mocp -n -T alldefault'
alias df='dfc -T'
alias we='curl wttr.in/Gent'
alias weather='curl wttr.in/Gent'
alias kgp="kubectl get pods --all-namespaces"
alias ssl_tls_certs="openssl req -newkey rsa:2048 -nodes -keyout tls.key -x509 -days 365 -out tls.crt"
alias compress="ffmpeg -i video1.mp4 -vcodec h264 -acodec mp2 output.mp4"
alias fixflake="pip uninstall -y flake9 flake8 && pip install --upgrade flake9"


# docker
alias docka="docker run --rm -it alpine sh"

alias cat="bat"
alias ls='eza'
alias ll='eza -lbghUm'
alias l='eza -lbghUm'
alias s='eza -lbghUm'

# -----------------------------------------------------------------------------------------------------------------------------
# DRONE
# -----------------------------------------------------------------------------------------------------------------------------

# export DRONE_TOKEN=$(pass show websites/ci.wegroup.io/token | head -n1)
export DRONE_SERVER=https://ci.wegroup.io
export DRONE_AUTOSCALER=https://ci.wegroup.io

# -----------------------------------------------------------------------------------------------------------------------------
# VAULT / ANSIBLE
# -----------------------------------------------------------------------------------------------------------------------------

export BASTION_USER=seba
export VAULT_ADDR=https://vault.linode.wegroup.be
export ANSIBLE_HASHI_VAULT_ADDR=https://vault.linode.wegroup.be

# -----------------------------------------------------------------------------------------------------------------------------
# FUNCTIONS
# -----------------------------------------------------------------------------------------------------------------------------

vv(){
    file=`cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 16 | head -n 1`
    nvim /tmp/$file
}
vvp(){
    file=`cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 16 | head -n 1`
    nvim /tmp/$file.py
}
vvj(){
    file=`cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 16 | head -n 1`
    nvim /tmp/$file.json
}

# -----------------------------------------------------------------------------------------------------------------------------
# YAZI
# -----------------------------------------------------------------------------------------------------------------------------

function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd "$cwd"
	fi
	rm -f -- "$tmp"
}
alias lf="yy"

# -----------------------------------------------------------------------------------------------------------------------------
# GIT
# -----------------------------------------------------------------------------------------------------------------------------

gitquick () {
    if [[ $* = "" ]]; then
        echo "please change your behavior and make a fucking commit message!"
    else
        git add .
        git commit -m "$*"
        git push origin
    fi
}

# -----------------------------------------------------------------------------------------------------------------------------
# FZF
# -----------------------------------------------------------------------------------------------------------------------------
#
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND="rg --files --hidden --ignore-file .gitignore_global ."
export FZF_DEFAULT_OPTS='-m --height 40% --layout=reverse --border'
export FZF_DEFAULT_OPTS="-m --height 40% --layout=reverse --border --bind ctrl-k:preview-up,ctrl-j:preview-down,ctrl-d:preview-page-down,ctrl-u:preview-page-up --preview 'bat {}'"

vf() { fzf --height 100% --preview '[[ $(file --mime {}) =~ binary ]] &&
                echo {} is a binary file ||
                (highlight -O ansi -l {} ||
                 coderay {} ||
                 rougify {} ||
                 cat {}) 2> /dev/null | head -500' | xargs -r -I % $EDITOR % ;}


export XMLLINT_INDENT="    "

export FZF_COMPLETION_TRIGGER=""
setopt vi # Removes the default FZF '<TAB>' keybinding

fzf-and-run-widget() {
}
zle -N         fzf-and-run-widget
bindkey '^[^I' fzf-and-run-widget


# -----------------------------------------------------------------------------------------------------------------------------
# COMPLETIONS
# -----------------------------------------------------------------------------------------------------------------------------


eval "$(atuin init zsh)"
