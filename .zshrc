# -----------------------------------------------------------------------------------------------------------------------------
# ENVIRONMENT_VARIABLES
# -----------------------------------------------------------------------------------------------------------------------------

export ZSH=~/.oh-my-zsh
export TMOUT=9600
export TERM="tmux-256color"
export PAGER=less
export EDITOR="nvim"
export BROWSER="qutebrowser"
export PATH=~/scripts:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/root/.vimpkg/bin:~/.vimpkg/bin:~/.config/composer/vendor/bin

# -----------------------------------------------------------------------------------------------------------------------------
# GENERAL
# -----------------------------------------------------------------------------------------------------------------------------
#
ENABLE_CORRECTION="true"
setopt AUTO_CD
setopt NO_BEEP
setopt NO_CASE_GLOB
setopt EXTENDED_GLOB

# -----------------------------------------------------------------------------------------------------------------------------
# ohmyzsh
# -----------------------------------------------------------------------------------------------------------------------------

ZSH_THEME="powerzeesh"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting tmux fossil) 
source $ZSH/oh-my-zsh.sh

# -----------------------------------------------------------------------------------------------------------------------------
# aliasses
# -----------------------------------------------------------------------------------------------------------------------------

alias ra='ranger'
alias gpom="git push origin master"
alias gits="git status"
alias gc="git clone"
alias gda="git diff -a"
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
alias L='less'
alias bat='acpi -b | cut -d " " -f4,5 | sed 's/,//''
alias browse='w3m -F -graph -o auto_image=TRUE'
alias imageburner='/usr/bin/Etcher-1.0.0-beta.19-linux-x64.AppImage'
alias music='echo "press enter to play" && mocp -n -T alldefault'
alias video='mpv'
alias reddit='rtv --enable-media'
alias rtv='rtv --enable-media'
alias vim='nvim'
alias sudo='sudo '
alias df='dfc -T'
alias ll='ls -latrFi'
alias we='curl wttr.in/Gent'
alias pdf='mupdf'

## one letter aliasses

alias l='ls -latrFi'
alias r='ranger'
alias v='nvim'
alias i='feh --geometry 400x400'
alias m='mutt'
alias n='cd /run/media/sevaho/'
alias c="clear"
alias t="tree"

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
# functions
# -----------------------------------------------------------------------------------------------------------------------------

tsm-clearcompleted () {

    transmission-remote -l | grep 100% | grep Done | awk '{print $1}' | xargs -n 1 -I % transmission-remote -t % -r

}

tsm () { transmission-remote --list }
tsmw () { watch transmission-remote --list }

tsm-purge () { transmission-remote -t"$1" --remove-and-delete }

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
