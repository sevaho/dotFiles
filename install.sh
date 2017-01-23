#! /bin/bash

# Author: Sebastiaan Van Hoecke

main(){
git clone https://github.com/sevaho/dotFiles.git ~/dotFiles
cp -rf ~/dotfiles/.* ~/
rm -rf ~/dotFiles
}

#functions
main "${@}"

