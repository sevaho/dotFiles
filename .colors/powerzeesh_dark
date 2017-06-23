FG=black

#unicode characters
SEPARATOR="\ue0b0"
GITDIFFERENT="\u00b1"
BRANCH="\ue0a0"
DETACHED="\u27a6"
CROSS="\u2718"
GEAR="\u2699"
STAR="\u2738"

#Colors picked from 256 colors
color_prompt_name=66
color_prompt_dir=8
color_prompt_white=251
color_prompt_git_green=2
color_prompt_git_orange=208
color_prompt_git_red=1
color_prompt_root=1

#Segments
prompt_segment () {

    local bg fg

    [[ -n $1 ]] && bg="%K{$1}" || bg="%k"
    [[ -n $2 ]] && fg="%F{$2}" || fg="%f"

    if [[ $CURRENT_BG != 'NONE' && $1 != $CURRENT_BG ]]; then

        print -n "%{$bg%F{$CURRENT_BG}%}$SEPARATOR%{$fg%}"

    else

        print -n "%{$bg%}%{$fg%}"

    fi

    CURRENT_BG=$1
    [[ -n $3 ]] && print -n $3

}

prompt_end () {

    if [[ -n $CURRENT_BG ]]; then

        print -n "%{%k%F{$CURRENT_BG}%}$SEPARATOR"

    else

        print -n "%{%k%}"

    fi

    print -n "%{%f%}"
    CURRENT_BG=''

}

prompt_context () {

    local user=`whoami`

    if [[ $(id -u) -ne 0 || -n "$SSH_CONNECTION" ]]; then

        prompt_segment $color_prompt_name black " %(!.%{%F{black}%}.)$user "

    else

        prompt_segment $color_prompt_root black " %(!.%{%F{black}%}.)$user "

    fi

}

prompt_git () {

    local color ref

    is_dirty () {

        test -n "$(git status --porcelain --ignore-submodules)"

    }

    commitsAhead () {

        test -n "$(git_commits_ahead)"

    }

    ref="$vcs_info_msg_0_"

    if [[ -n "$ref" ]]; then

        if is_dirty; then

            color=$color_prompt_git_red
            ref="${ref} $PLUSMINUS"

        elif commitsAhead; then

            color=$color_prompt_git_orange
            ref="${ref} $STAR"

        else

            color=$color_prompt_git_green
            ref="${ref} "

        fi

        if [[ "${ref/.../}" == "$ref" ]]; then

            ref="$BRANCH $ref"

        else

            ref="$DETACHED ${ref/.../}"

        fi

        prompt_segment $color $FG
        print -Pn " $ref"

    fi

}

prompt_fossil () {

    local _OUTPUT=`fossil branch 2>&1`
    local _STATUS=`echo $_OUTPUT | grep "use --repo"`

    if [ "$_STATUS" = "" ]; then

        local _EDITED=`fossil changes`
        local _EDITED_SYM="$ZSH_THEME_FOSSIL_PROMPT_CLEAN"
        local _BRANCH=`echo $_OUTPUT | grep "* " | sed 's/* //g'`

        if [ "$_EDITED" != "" ]; then

            color=$color_prompt_git_red
            ref=$(fossil changes | wc -l)

        else

            color=$color_prompt_git_green
            ref=$(fossil changes | wc -l)

        fi

        prompt_segment $color $FG
        print -Pn " $ref "   

    fi

}

prompt_dir () {

    prompt_segment $color_prompt_dir $color_prompt_white ' %~ '

}

#White arrow at the end of prompt_dir
prompt_dir_end () {

    prompt_segment $color_prompt_white $color_prompt_white ' '

}

# Status:
# - was there an error
# - are there background jobs?
prompt_status () {

    local symbols
    symbols=()

    [[ $RETVAL -ne 0 ]] && symbols+="%{%F{red}%}$CROSS $RETVAL"
    [[ $(jobs -l | wc -l) -gt 0 ]] && symbols+="%{%F{cyan}%}$GEAR"

#Vagrant
    if [[ -d ./.vagrant/machines  ]]; then

        if [[ -f .vagrant/machines/default/virtualbox/id && $(VBoxManage list runningvms | grep -c $(/bin/cat .vagrant/machines/*/*/id)) -gt 0  ]]; then

            symbols+="%{%F{green}%}V"
            else
            symbols+="%{%F{red}%}V"

        fi

    fi

    [[ -n "$symbols" ]] && prompt_segment $FG default " $symbols "

}

prompt_virtualenv () {

    if [[ -n $VIRTUAL_ENV ]]; then

        color=cyan
        prompt_segment $color $FG
        print -Pn " $(basename $VIRTUAL_ENV) "

    fi

}

prompt_right () {

    if [[ -d ./node_modules ]]; then
        print -n "[%{%B%F{green}%}"`node -v 2> /dev/null`"%{%F{default}%b%}]%{%k%f%}"

    fi

}

prompt () {

    RETVAL=$?
    CURRENT_BG='NONE'
    prompt_status
    prompt_context
    prompt_virtualenv
    prompt_dir
    prompt_dir_end
    prompt_git
    prompt_fossil
    prompt_end

}

prompt_precmd () {

    vcs_info
    PROMPT='%{%f%b%k%}$(prompt) '
    RPROMPT='%{%f%b%k%}$(prompt_right) '

}

prompt_setup () {

    autoload -Uz add-zsh-hook
    autoload -Uz vcs_info

    prompt_opts=(cr subst percent)

    add-zsh-hook precmd prompt_precmd

    zstyle ':vcs_info:*' enable git
    zstyle ':vcs_info:*' check-for-changes false
    zstyle ':vcs_info:git*' formats '%b'
    zstyle ':vcs_info:git*' actionformats '%b (%a)'

}

prompt_setup "$@"

