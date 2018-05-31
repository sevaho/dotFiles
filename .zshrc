# ----------------------------------------------------------------------------------------------------------------------------- 
# TTY
# -----------------------------------------------------------------------------------------------------------------------------

banner_info () {

    DISTRO=$(cat /etc/*release* | grep -oP 'NAME="\K[^"]+' | head -n1)
    KERNEL=$(uname -r)
    PACKAGES_COUNT=$(test -f /bin/pacman && /usr/bin/pacman -Qq | wc -l || dpkg-query -l | wc -l) 
    PACKAGES_TO_UPDATE=$(test -f /bin/checkupdates && checkupdates | wc -l || echo $(( $(apt list --upgradable 2> /dev/null | wc -l) - 1 )))
    HOSTNAME=$(hostname)
    UPTIME=$(uptime -p)
    CPU=$(awk 'BEGIN{FS=":"} /model name/ { print $2; exit }' /proc/cpuinfo | awk 'BEGIN{FS=" @"; OFS="\n"} { print $1; exit }')
    USERS=$(who)
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
    echo ""
    echo "Packages to update: $PACKAGES_TO_UPDATE\tPackages installed: $PACKAGES_COUNT"
    echo ""
    echo "Uptime: $UPTIME"
    echo ""
    echo "Users:"
    echo "$USERS"
    echo ""
    echo "#############################################################################################"
    printf "\x1b[38;0m" # normal

}

if [[ -n "$SSH_CONNECTION" ]] ; then 

    banner_info

elif [[ $TTY == "/dev/tty1" ]]; then 

    banner_info

fi

# -----------------------------------------------------------------------------------------------------------------------------
# ENVIRONMENT_VARIABLES
# -----------------------------------------------------------------------------------------------------------------------------

export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'
export LFS="/mnt/lfs"
export ZSH=~/.oh-my-zsh
export TMOUT=9600
export PAGER=less
export BROWSER="qutebrowser"
export RTV_BROWSER="w3m"
export PATH=~/scripts:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/root/.vimpkg/bin:~/.vimpkg/bin:~/.config/composer/vendor/bin:~/.go/bin:~/.cargo/bin:~/.gem/ruby/2.5.0/bin:/usr/bin/vendor_perl:~/.local/bin:/opt/google-cloud-sdk/bin
export fpath=($HOME/.zsh-completions $fpath)
export GOPATH=~/.go

if [[ -n "$SSH_CONNECTION" ]] ; then 

    export TERM="xterm"
    export EDITOR="vim"

else

    export TERM="xterm-256color"
    export EDITOR="nvim"

fi

# -----------------------------------------------------------------------------------------------------------------------------
# GENERAL
# -----------------------------------------------------------------------------------------------------------------------------

ENABLE_CORRECTION="true"
setopt AUTO_CD
setopt NO_BEEP
setopt NO_CASE_GLOB
setopt EXTENDED_GLOB

# -----------------------------------------------------------------------------------------------------------------------------
# OHMYZSH
# -----------------------------------------------------------------------------------------------------------------------------

ZSH_THEME="powerzeesh"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting vi-mode pyenv python)  
source $ZSH/oh-my-zsh.sh

# -----------------------------------------------------------------------------------------------------------------------------
# ALIASES
# -----------------------------------------------------------------------------------------------------------------------------

if [[ -n "$SSH_CONNECTION" ]] ; then 

    alias v='vim'

else

    alias vim='nvim'
    alias v='nvim'

fi

alias password16="cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 16 | head -n 1"
alias password32="cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1"
alias password64="cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 64 | head -n 1"
alias rt='rtorrent'
alias gpom="git push origin master"
alias gits="git status"
alias gc="git checkout"
alias gp="git pull"
alias gda="git diff -a"
alias docka="docker run --rm -it alpine sh"
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
alias L='less'
alias browse='w3m -F -graph -o auto_image=TRUE'
alias imageburner='etcher'
alias music='echo "press enter to play" && mocp -n -T alldefault'
alias video='mpv'
alias reddit='rtv --enable-media'
alias rtv='rtv --enable-media'
alias sudo='sudo '
alias df='dfc -T'
alias ll='ls -latrFi'
alias we='curl wttr.in/Gent'
alias weather='curl wttr.in/Gent'
alias pdf='zathura'
alias vscode='code'
alias soundcloud="scdl"
alias mp3="youtube-dl --extract-audio --audio-format mp3"

## one letter aliasses

alias l='ls -latrFi'
alias r='ranger'
alias e='emacs -nw'
alias i='feh --geometry 400x400'
alias m='neomutt'
alias o='cd /run/media/$USER/'
alias n='/usr/bin/newsboat'
alias t="tree"
alias p="python"
alias s="slack-term"

## nmap

alias nmap_open_ports="nmap --open"
alias nmap_list_interfaces="nmap --iflist"
alias nmap_slow="nmap -sS -v -T1"
alias nmap_fin="nmap -sF -v"
alias nmap_full="nmap -sS -T4 -PE -PP -PS80,443 -PY -g 53 -A -p1-65535 -v"
alias nmap_check_for_firewall="nmap -sA -p1-65535 -v -T4"
alias nmap_ping_through_firewall="nmap -PS -PA"
alias nmap_fast="nmap -F -T5 --version-light --top-ports 300"
alias nmap_detect_versions="nmap -sV -p1-65535 -O --osscan-guess -T4 -Pn"
alias nmap_check_for_vulns="nmap --script=vulscan"
alias nmap_full_udp="nmap -sS -sU -T4 -A -v -PE -PS22,25,80 -PA21,23,80,443,3389 "
alias nmap_traceroute="nmap -sP -PE -PS22,25,80 -PA21,23,80,3389 -PU -PO --traceroute "
alias nmap_full_with_scripts="sudo nmap -sS -sU -T4 -A -v -PE -PP -PS21,22,23,25,80,113,31339 -PA80,113,443,10042 -PO --script all " 
alias nmap_web_safe_osscan="sudo nmap -p 80,443 -O -v --osscan-guess --fuzzy "

# -----------------------------------------------------------------------------------------------------------------------------
# FUNCTIONS
# -----------------------------------------------------------------------------------------------------------------------------

wificonnect () {

    if [ "$1" = "" ]; then

        echo "specify /etc/wpa_supplicant/<FILE>"
        return

    fi

    if [ "$(ps aux | grep dhcpcd | wc -l)" -eq 1 ]; then

        sudo dhcpcd

    fi

    if [ "$(ps aux | grep wpa_supplicant | wc -l)" -gt 1 ]; then

        echo "already connected"
        sudo killall wpa_supplicant
        sleep 3
        sudo wpa_supplicant -B -i wlp4s0 -c "$1"

    else

        sudo wpa_supplicant -B -i wlp4s0 -c "$1"

    fi

}

# switch colors
light () {

    xrdb ~/.colors/.Xresources_light
    sed -i -e 's/colorscheme minimalist/\" colorscheme minimalist/g' ~/.config/nvim/init.vim
    sed -i -e 's/\" colorscheme PaperColor/colorscheme PaperColor/g' ~/.config/nvim/init.vim
    sed -i -e 's/\" colorscheme PaperColor/colorscheme PaperColor/g' ~/.config/nvim/init.vim

}

black () {

    xrdb ~/.colors/.Xresources_black
    sed -i -e 's/colorscheme PaperColor/\" colorscheme PaperColor/g' ~/.config/nvim/init.vim
    sed -i -e 's/\" colorscheme minimalist/colorscheme minimalist/g' ~/.config/nvim/init.vim
    sed -i -e 's/\" colorscheme minimalist/colorscheme minimalist/g' ~/.config/nvim/init.vim

}

# calendar
c () {

    vdirsyncer sync
    rm -v ~/.calcurse/apts

    for event in $(ls ~/.calendars/*/*.ics); do
            
        calcurse -i $event 

    done

    calcurse

}

ww () {

    echo "Use M to copy url and ESCM to copy url under cursor."
    w3m ${@}

}

gitquick () {

    if [[ $1 = "" ]]; then

        string="git quick push"

    else

        string=$1

    fi

    git add .
    git commit -m "$string"
    git push origin

}

wifiscan () {

    sudo iw dev wlp4s0 scan
    printf "\x1b[36;1m  SSID\n\n" 
    sudo iw dev wlp4s0 scan | grep SSID

}

pull () {

    for i in *; do

        printf "\x1b[36;1m\n" 
        echo "-> checking $i"

        if test -n "$(git -C $i status --porcelain --ignore-submodules)"; then

            printf "\x1b[31;1m" 
            echo "=====>> \tdirty repo: $i"

        fi

        printf "\x1b[38;0m\n" 
        git -C $i pull

    done

}

git_clone_all_server () {

    for repo in $(ssh sevahoFileServer ls /data/Git); do

        echo $repo
        git clone ssh://sevaho@localhost:2202/data/Git/$repo


    done

}

# -----------------------------------------------------------------------------------------------------------------------------
# SERVERS
# -----------------------------------------------------------------------------------------------------------------------------

remoteWindows () {

    WINDOWS_SERVER_PASS=$(pass windows/pass)
    ssh -fL 3389:192.168.0.3:3389 sevahoSSHServer sleep 5
    xfreerdp /v:localhost /port:3389 /u:Administrator /p:"$WINDOWS_SERVER_PASS" /w:1700 /h:900

}

ssh_SSHServer () {

    ssh sevahoSSHServer

}

ssh_BuildServer () {

    ssh -fL 2201:192.168.0.4:22 sevahoSSHServer sleep 5
    ssh sevaho@localhost -p 2201

}

ssh_FileServer () {

    ssh -fL 2202:192.168.0.5:22 sevahoSSHServer sleep 5
    ssh sevaho@localhost -p 2202

}

ssh_CCServer () {

    ssh -fL 2203:192.168.0.6:22 sevahoSSHServer sleep 5
    ssh sevaho@localhost -p 2203

}

# WORK ----

ssh_wgop () {

    ssh wg-op

}

ssh_wgbuild () {

    ssh wg-build

}

# -----------------------------------------------------------------------------------------------------------------------------
# FZF
# -----------------------------------------------------------------------------------------------------------------------------

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# -----------------------------------------------------------------------------------------------------------------------------
# KUBERNETES
# -----------------------------------------------------------------------------------------------------------------------------

if [ $commands[kubectl] ]; then

    source <(kubectl completion zsh)

fi

if [ $commands[helm] ]; then

    source <(helm completion zsh)

fi

# -----------------------------------------------------------------------------------------------------------------------------
# GCLOUD
# -----------------------------------------------------------------------------------------------------------------------------

[ -f /opt/google-cloud-sdk/completion.zsh.inc ] && source /opt/google-cloud-sdk/completion.zsh.inc

# -----------------------------------------------------------------------------------------------------------------------------
# MISC
# -----------------------------------------------------------------------------------------------------------------------------

# source ~/.goodies.zsh
