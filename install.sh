#!/bin/bash

# enables to grab hidden files
shopt -s dotglob

# -----------------------------------------------------------------------------------------------------------------------------
# VARIABLES
# -----------------------------------------------------------------------------------------------------------------------------

DIR="/tmp/dotFiles"

declare -A FILES_TO_IGNORE=( 

    [$DIR/*]=1  
    [$DIR/img]=1  
    [$DIR/etc]=1  
    [$DIR/.gitignore]=1  
    [$DIR/README.md]=1  
    [$DIR/install.sh]=1  

)

SERVER_FILES_ONLY=(

    $DIR/.zshrc
    $DIR/.vimrc
    $DIR/.oh-my-zsh
    $DIR/.config/nvim
    $DIR/.config/ranger
    $DIR/.config/htop

)

# -----------------------------------------------------------------------------------------------------------------------------
# FUNCTIONS
# -----------------------------------------------------------------------------------------------------------------------------

dowload_git_repo () { 

    env git clone --depth=1 https://github.com/sevaho/dotFiles.git $DIR || {

        printf "Error: git clone of dotFiles\n"
        exit 1

    }

}

copy_dotFiles () { 

    for f in $DIR/*; do


        [[ -n "${FILES_TO_IGNORE[$f]}" ]] || printf '%s\n' "$f copied" && cp -vrf "$f" ~/

    done

}

copy_dotFiles_server () { 

    for f in $SERVER_FILES_ONLY; do

        echo "$f"
        cp -vrf "$f" ~/

    done

}

post_installs () { 

    #ZSH plugins
    env git clone --depth=1 git://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions || {

        printf "Error: git clone of zsh autosuggest\n"
        exit 1

    }

    env git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting || {

        printf "Error: git clone of zsh syntax highlight\n"
        exit 1

    }

    #powerzeesh theme
    env git clone --depth=1 git://github.com/sevaho/Powerzeesh ~/.oh-my-zsh/themes || {

        printf "Error: git clone of powerzeesh\n"
        exit 1

    }

}

usage () {

cat <<- _EOF_

Usage: ${0} [OPTIONS]... 

Install script for sevaho/dotFiles from Github.

OPTIONS:
    -h, *           display the help and exit
    -d              install for a desktop/laptop
    -s              install for a server
    
EXAMPLES:
    install -d
    install -s

NOTE:
   The difference between desktop and server is that on a server you don't need X config files and other
   GUI related files.

_EOF_

}

main () {

    echo "Desktop or server?' [D/S]"
    read -r ANSWER

    if [[ $ANSWER = "D" || $ANSWER = "d" ]]; then

        rm -vrf $DIR

        dowload_git_repo
        copy_dotFiles
        post_installs

        echo "removing $DIR"
        rm -rf $DIR

    elif [[ $ANSWER = "S"  || $ANSWER = "s" ]]; then

        rm -vrf $DIR

        dowload_git_repo
        copy_dotFiles_server
        post_installs

        echo "removing $DIR"
        rm -rf $DIR

    else

        usage
        exit 1

    fi
}

# -----------------------------------------------------------------------------------------------------------------------------
# MAIN
# -----------------------------------------------------------------------------------------------------------------------------

main "${@}"

shopt -u dotglob
