#!/bin/env bash

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
    [$DIR/.git]=1  

)

declare -a SERVER_FILES_ONLY=(

    $DIR/.zshrc
    $DIR/.tmux.conf
    $DIR/.vimrc
    $DIR/.oh-my-zsh
    $DIR/.config

)

# -----------------------------------------------------------------------------------------------------------------------------
# FUNCTIONS
# -----------------------------------------------------------------------------------------------------------------------------

download_git_repo () { 

    env git clone --depth=1 https://github.com/sevaho/dotFiles.git $DIR || {

        printf "Error: git clone of dotFiles\n"
        exit 1

    }

}

copy_dotFiles () { 

    for f in $DIR/*; do

        [[ -n "${FILES_TO_IGNORE[$f]}" ]] || cp -vrf "$f" "$HOME/"

    done

}

copy_dotFiles_server () { 

    for f in "${SERVER_FILES_ONLY[@]}"; do

        echo "$f"
        cp -vrf "$f" "$HOME/"

    done

}

download_git_program_templates () { 

    local TEMPLATES_DIR="$HOME/.config/nvim/templates"

    [[ -d $TEMPLATES_DIR ]] || mkdir -p $TEMPLATES_DIR

    env git clone --depth=1 https://github.com/sevaho/programming-templates.git $HOME/.config/nvim/templates || {

        printf "Error: git clone of programming templates\n"
        exit 1

    }

}

post_installs () { 

    local PLUGIN_DIR="$HOME/.oh-my-zsh/custom/plugins"

    # zsh plugins
    rm -rvf "$PLUGIN_DIR/zsh-autosuggestions"

    env git clone --depth=1 git://github.com/zsh-users/zsh-autosuggestions "$PLUGIN_DIR/zsh-autosuggestions" || {

        printf "Error: git clone of zsh autosuggest\n"
        exit 1

    }

    rm -rvf "$PLUGIN_DIR/zsh-syntax-highlighting"

    env git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git "$PLUGIN_DIR/zsh-syntax-highlighting" || {

        printf "Error: git clone of zsh syntax highlight\n"
        exit 1

    }

    # powerzeesh theme
    rm -rvf "$HOME/.oh-my-zsh/themes"
    mkdir -p "$HOME/.oh-my-zsh/themes"

    env git clone --depth=1 git://github.com/sevaho/Powerzeesh "$HOME/.oh-my-zsh/themes" || {

        printf "Error: git clone of powerzeesh\n"
        exit 1

    }

}

post_server_installs () {

    rm -rf "$HOME/.config/systemd/user/default.target.wants/offlineimap.timer"
    rm -rf "$HOME/.config/systemd/user/offlineimap.timer"
    rm -rf "$HOME/.config/systemd/user/offlineimap.service"
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

# -----------------------------------------------------------------------------------------------------------------------------
# MAIN
# -----------------------------------------------------------------------------------------------------------------------------

main () {

    echo "Desktop or server?' [D/S]"
    read -r ANSWER

    if [[ $ANSWER = "D" || $ANSWER = "d" ]]; then

        rm -vrf $DIR

        download_git_repo
        copy_dotFiles
        download_git_program_templates
        post_installs

        echo "removing $DIR"
        rm -rf $DIR

    elif [[ $ANSWER = "S"  || $ANSWER = "s" ]]; then

        rm -vrf $DIR

        download_git_repo
        copy_dotFiles_server
        download_git_program_templates
        post_installs
        post_server_installs

        echo "removing $DIR"
        rm -rf $DIR

    else

        usage
        exit 1

    fi
}

main "${@}"

shopt -u dotglob
