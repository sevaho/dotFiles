#exports
export ZSH=~/.oh-my-zsh
export TMOUT=9600
export TERM="tmux-256color"
export PAGER=less
export PATH=~/scripts:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/root/.vimpkg/bin:~/.vimpkg/bin:~/.config/composer/vendor/bin

#options
ENABLE_CORRECTION="true"
setopt AUTO_CD
setopt NO_BEEP
setopt NO_CASE_GLOB
setopt EXTENDED_GLOB

#ohmyzsh
ZSH_THEME="powerzeesh"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting tmux)
source $ZSH/oh-my-zsh.sh

#alias
alias ll='ls -latrFi'
alias ra='ranger'
alias gpom="git push origin master"
alias gits="git status"
alias gc="git clone"
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
alias music='echo "press enter to play" && mocp -n -T ~/themes/alldefault'
alias video='mpv'
alias reddit='rtv'
alias vim='nvim'

# nmap
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

#Protect root
if [ "$(id -ru)" -eq "0"  ]; then
  alias rm='rm -i'
  alias cp='cp -i'
  alias mv='mv -i'
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


xset s off
xset s off -dpms	

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
