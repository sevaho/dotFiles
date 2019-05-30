# ----------------------------------------------------------------------------------------------------------------------------- 
# TTY
# -----------------------------------------------------------------------------------------------------------------------------

banner_info () {

    DISTRO=$(cat /etc/*release* | grep -oP 'NAME="\K[^"]+' | head -n1)
    KERNEL=$(uname -r)
    PACKAGES_COUNT=$(test -f /bin/pacman && /usr/bin/pacman -Qq | wc -l || dpkg-query -l | wc -l) 
    # PACKAGES_TO_UPDATE=$(test -f /bin/checkupdates && checkupdates | wc -l || echo $(( $(apt list --upgradable 2> /dev/null | wc -l) - 1 )))
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
export RTV_BROWSER="surf"
export PATH=~/scripts:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/root/.vimpkg/bin:~/.vimpkg/bin:~/.config/composer/vendor/bin:~/.go/bin:~/.cargo/bin:~/.gem/ruby/2.6.0/bin:/usr/bin/vendor_perl:~/.local/bin:/opt/google-cloud-sdk/bin
export fpath=($HOME/.zsh-completions $fpath)
export GOPATH=~/.go
export OPENER=xdg-open

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
plugins=(git zsh-autosuggestions zsh-syntax-highlighting pyenv python vagrant taskwarrior vi-mode)
source $ZSH/oh-my-zsh.sh

# -----------------------------------------------------------------------------------------------------------------------------
# KEY BINDS
# -----------------------------------------------------------------------------------------------------------------------------

bindkey "^k" up-line-or-history
bindkey "^j" down-line-or-history

# -----------------------------------------------------------------------------------------------------------------------------
# ALIASES
# -----------------------------------------------------------------------------------------------------------------------------

if [[ -n "$SSH_CONNECTION" ]] ; then 

    alias v='vim'

else

    alias vim='nvim'
    alias v='nvim'

fi


alias peinit="pipenv install 'pynvim' 'python-language-server[all]' 'pyls-isort' --dev"
# PIPENV
export PIPENV_DEFAULT_PYTHON_VERSION=3.7
export PIPENV_MAX_DEPTH=5
export PIPENV_SKIP_LOCK=1
export PIPENV_SPINNER=pong

alias j="joplin"
alias pt="while true; do; pytest --disable-warnings | less; done"
alias password16="cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 16 | head -n 1 | xsel -b"
alias password32="cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1 | xsel -b"
alias password64="cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 64 | head -n 1 | xsel -b"
alias rt='rtorrent'
alias cdg='cd ~/.go'
alias gpom="git push origin master"
alias gits="git status"
alias gc="git checkout"
alias gr="git show-ref"
alias gp="git pull"
alias gda="git diff -a"
alias gmd="git merge dev"
alias gms="git merge staging"
alias tiga="tig --all"
alias temp='cat /sys/bus/acpi/drivers/thermal/LNXTHERM\:00/thermal_zone/temp'
alias du='du -sh *' 
alias df='df -kTh'
alias tree='tree -Csuh'
alias xs='cd'
alias moer='more'
alias moew='more'
alias kk='ll'
alias more='less'
alias L='less'
alias music='echo "press enter to play" && mocp -n -T alldefault'
alias reddit='rtv --enable-media'
alias rtv='rtv --enable-media'
alias df='dfc -T'
alias ll='ls -latrFi'
alias we='curl wttr.in/Gent'
alias weather='curl wttr.in/Gent'
alias pdf='zathura'
alias vscode='code'
alias soundcloud="scdl"
alias mp3="youtube-dl --extract-audio --audio-format mp3"
alias kgp="kubectl get pods --all-namespaces"
alias ytdl="youtube-dl -f bestaudio --audio-quality 0 --audio-format mp3 -i -x --extract-audio"
alias ssl_tls_certs="openssl req -newkey rsa:2048 -nodes -keyout tls.key -x509 -days 365 -out tls.crt"
alias sl="slack-term"
alias hdmi="pavucontrol"
alias compress="ffmpeg -i video1.mp4 -vcodec h264 -acodec mp2 output.mp4"
alias image="shotwell"
alias presentation="mpd"

## one letter aliasses

alias l='ls -latrFi'
alias s='ls -latrFi'
alias r='lf'
alias e='emacs -nw'
alias i='feh --geometry 400x400'
alias m='neomutt'
alias o='cd /run/media/$USER/'
alias n='/usr/bin/newsboat'
alias t="task"
alias p="python"
alias k="kubectl"

# docker
alias docka="docker run --rm -it alpine sh"
alias dk="docker-compose"
alias dku="docker-compose up"
alias dkud="docker-compose up -d"

## nmap

# alias nmap_open_ports="nmap --open"
# alias nmap_list_interfaces="nmap --iflist"
# alias nmap_slow="nmap -sS -v -T1"
# alias nmap_fin="nmap -sF -v"
# alias nmap_full="nmap -sS -T4 -PE -PP -PS80,443 -PY -g 53 -A -p1-65535 -v"
# alias nmap_check_for_firewall="nmap -sA -p1-65535 -v -T4"
# alias nmap_ping_through_firewall="nmap -PS -PA"
# alias nmap_fast="nmap -F -T5 --version-light --top-ports 300"
# alias nmap_detect_versions="nmap -sV -p1-65535 -O --osscan-guess -T4 -Pn"
# alias nmap_check_for_vulns="nmap --script=vulscan"
# alias nmap_full_udp="nmap -sS -sU -T4 -A -v -PE -PS22,25,80 -PA21,23,80,443,3389 "
# alias nmap_traceroute="nmap -sP -PE -PS22,25,80 -PA21,23,80,3389 -PU -PO --traceroute "
# alias nmap_full_with_scripts="sudo nmap -sS -sU -T4 -A -v -PE -PP -PS21,22,23,25,80,113,31339 -PA80,113,443,10042 -PO --script all " 
# alias nmap_web_safe_osscan="sudo nmap -p 80,443 -O -v --osscan-guess --fuzzy "

# -----------------------------------------------------------------------------------------------------------------------------
# FUNCTIONS
# -----------------------------------------------------------------------------------------------------------------------------

notes_syncer () {
    FUNCTION=$1
    FILE=$2
    RUNNING_PROCS=$(ps aux | grep "nvim /home/sevaho/.notes/$FILE" | wc -l)

    if [[ $RUNNING_PROCS > 1 ]]; then

        echo "already running in other window!"

    else

        git -C ~/Gitea/notes pull 
        $FUNCTION ~/.notes/$FILE
        push_repo () {
            git -C ~/Gitea/notes add ~/Gitea/notes/. 
            git -C ~/Gitea/notes commit -m "autopush"
            git -C ~/Gitea/notes push
        }
        (push_repo &)

    fi
}

notes () {
    notes_syncer nvim notes.md
}
ideas () {
    notes_syncer nvim ideas.md
}
todo () {
    notes_syncer nvim todo.md
}
planning () {
    notes_syncer sc-im planning.sc
}
blog () {
    notes_syncer nvim blog.md
}

# bin2shell () {
#
#     for i in $(objdump -d $1 |grep "^ " |cut -f2); do echo -n '\x'$i; done;echo
#
# }

# wificonnect () {
#
#     if [ "$1" = "" ]; then
#
#         echo "specify /etc/wpa_supplicant/<FILE>"
#         return
#
#     fi
#
#     if [ "$(ps aux | grep dhcpcd | wc -l)" -eq 1 ]; then
#
#         sudo dhcpcd
#
#     fi
#
#     if [ "$(ps aux | grep wpa_supplicant | wc -l)" -gt 1 ]; then
#
#         echo "already connected"
#         sudo killall wpa_supplicant
#         sleep 3
#         sudo wpa_supplicant -B -i wlp4s0 -c "$1"
#
#     else
#
#         sudo wpa_supplicant -B -i wlp4s0 -c "$1"
#
#     fi
#
# }

# switch colors
# light () {
#
#     xrdb ~/.colors/.Xresources_light
#     sed -i -e 's/colorscheme minimalist/\" colorscheme minimalist/g' ~/.config/nvim/init.vim
#     sed -i -e 's/\" colorscheme PaperColor/colorscheme PaperColor/g' ~/.config/nvim/init.vim
#     sed -i -e 's/\" colorscheme PaperColor/colorscheme PaperColor/g' ~/.config/nvim/init.vim
#
# }
#
# black () {
#
#     xrdb ~/.colors/.Xresources_black
#     sed -i -e 's/colorscheme PaperColor/\" colorscheme PaperColor/g' ~/.config/nvim/init.vim
#     sed -i -e 's/\" colorscheme minimalist/colorscheme minimalist/g' ~/.config/nvim/init.vim
#     sed -i -e 's/\" colorscheme minimalist/colorscheme minimalist/g' ~/.config/nvim/init.vim
#
# }

# calendar
c () {

    nvim -c "Calendar" 
    # vdirsyncer sync
    # rm -v ~/.calcurse/apts

    # for event in $(ls ~/.calendars/*/*.ics); do
    #         
    #     calcurse -i $event 
    #
    # done

    # calcurse

}

# ww () {
#
#     echo "Use M to copy url and ESCM to copy url under cursor."
#     w3m ${@}
#
# }

wifiscan () {

    sudo iw dev wlp4s0 scan
    printf "\x1b[36;1m  SSID\n\n" 
    sudo iw dev wlp4s0 scan | grep -e SSID -e Authentication

}

mpvs () {

    mpv "$1" --sub-file="$2"

}

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

# git_tag_patch () {
#
#     if [[ $1 = "" ]]; then
#
#         echo "add description please"
#         return
#
#     else
#
#         msg=$1
#
#         LATEST_TAG=$(git describe --match "$ENV_TAG_PREFIX[0-9]*" --abbrev=0 --tags)
#         echo "Current tag $LATEST_TAG"
#
#         version=$(echo $LATEST_TAG | grep -o '[^-]*$')
#
#         major=$(echo $version | cut -d. -f1)
#         minor=$(echo $version | cut -d. -f2)
#         patch=$(echo $version | cut -d. -f3)
#
#         patch=$(($patch + 1))
#
#         TAG="$major.$minor.$patch"
#         echo "Adding tag $TAG"
#
#         git tag $TAG -m $msg
#         git push origin --tags
#
#     fi
#
# }

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

# git_count_lines_directories () {
#
#         printf "\x1b[36;1m\n" 
#         git ls-files | xargs wc -l | tail -n 1 | tr -s " " | cut -d " " -f 2
#         printf "\x1b[38;0m\n" 
#
# }

# git_clone_all_server () {
#
#     for repo in $(ssh sevahoFileServer ls /data/Git); do
#
#         echo $repo
#         git clone ssh://sevaho@localhost:2202/data/Git/$repo
#
#
#     done
#
# }

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

export FZF_DEFAULT_COMMAND="rg --files --hidden --ignore-file .gitignore_global ."
export FZF_DEFAULT_OPTS='-m --height 40% --layout=reverse --border'

# Vim
# se() { du -a ~/.scripts/ *~/.config/* | awk '{print $2}' | fzf | xargs  -r $EDITOR ;}
# fv() { fzf | xargs -r -I % $EDITOR % ;}

# Try highlight, coderay, rougify in turn, then fall back to cat
vf() { fzf --height 100% --preview '[[ $(file --mime {}) =~ binary ]] &&
                echo {} is a binary file ||
                (highlight -O ansi -l {} ||
                 coderay {} ||
                 rougify {} ||
                 cat {}) 2> /dev/null | head -500' | xargs -r -I % $EDITOR % ;}

# -----------------------------------------------------------------------------------------------------------------------------
# KUBERNETES
# -----------------------------------------------------------------------------------------------------------------------------

if [ $commands[kubectl] ]; then

    source <(kubectl completion zsh)

fi

if [ $commands[helm] ]; then

    source <(helm completion zsh)

fi


khelm () {

    helm template . | kubectl apply -f -

}

khelm_delete () {

    helm template . | kubectl delete -f -

}

khelm_all () {

    for i in $(ls); do

        if [ -d "$i" ]; then

            if [ "$i" != "shared" ]; then

                helm template "$i" | kubectl apply -f -

            fi

        fi

    done

}

klogs () {

    namespace="$1"
    pod="$2"
    container="$3"
    POD=$(kubectl -n "$namespace" get pod -l app="$pod" -o jsonpath="{.items[0].metadata.name}")
    echo $POD

    if [[ "$container" != "" ]]; then
        kubectl -n "$namespace" logs "$POD" -c "$container" -f
    else
        kubectl -n "$namespace" logs "$POD" -f
    fi

}

# -----------------------------------------------------------------------------------------------------------------------------
# GCLOUD
# -----------------------------------------------------------------------------------------------------------------------------

[ -f /opt/google-cloud-sdk/completion.zsh.inc ] && source /opt/google-cloud-sdk/completion.zsh.inc

alias gcloud_dns_list="gcloud dns record-sets list -z wegroup"

gcloud_dns_name_create () {

    if [[ $1 = "" && $2 = "" ]]; then

        echo "specifiy DNS and IP"

    else

        DNSNAME="$1"
        IP="$2"

        gcloud dns record-sets transaction start -z wegroup
        gcloud dns record-sets transaction add -z wegroup --name $DNSNAME. --ttl 300 --type A "$IP" 
        gcloud dns record-sets transaction execute -z wegroup
        gcloud dns record-sets list -z wegroup | grep $DNSNAME

    fi

}

gcloud_dns_name_delete () {

    if [[ $1 = "" && $2 = "" ]]; then

        echo "specifiy DNS and IP"

    else

        DNSNAME="$1"
        IP="$2"

        gcloud dns record-sets transaction start -z wegroup
        gcloud dns record-sets transaction remove -z wegroup --name $DNSNAME. --ttl 300 --type A "$IP" 
        gcloud dns record-sets transaction execute -z wegroup

    fi

}

gcloud_container_last_build () {
    
    gcloud container builds log $(gcloud container builds list | head -n 2 | tail -n 1 | cut -d " " -f1) --stream

}


firewall_cloud () {

    gcloud compute firewall-rules list --filter network=default --sort-by priority --format="table(    
        name,       
        network,
        direction,
        priority, 
        sourceRanges.list():label=[SRC_RANGES],
        destinationRanges.list():label=[DEST_RANGES],
        allowed[].map().firewall_rule().list():label=ALLOW,
        denied[].map().firewall_rule().list():label=DENY,  
        sourceTags.list():label=[SRC_TAGS],              
        targetTags.list():label=[TARGET_TAGS]
    )" 

}

# -----------------------------------------------------------------------------------------------------------------------------
# AWS
# -----------------------------------------------------------------------------------------------------------------------------

# if [ $commands[aws] ]; then
#
#     source ~/.local/bin/aws_zsh_completer.sh
#
# fi


function chpwd(){
    ls
}


# -----------------------------------------------------------------------------------------------------------------------------
# MISC
# -----------------------------------------------------------------------------------------------------------------------------

# source <(gopass completion zsh)
# source ~/.goodies.zsh
# source <(pip completion --zsh)
