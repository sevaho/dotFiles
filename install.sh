#Author: Sebastiaan Van Hoecke

main(){

  rm -vrf ~/.dotFiles
  rm -vrf ~/.fonts

  env git clone --depth=1 https://github.com/sevaho/dotFiles.git ~/.dotFiles || {
    printf "Error: git clone of dotFiles\n"
    exit 1
  }
  env git clone --depth=1 https://github.com/powerline/fonts.git  ~/.fonts || {
    printf "Error: git clone of dotFiles\n"
    exit 1
  }

  cp -vrf ~/.dotFiles/.conkyrc ~/
  cp -vrf ~/.dotFiles/.bashrc ~/
  cp -vrf ~/.dotFiles/.tmux.conf ~/
  cp -vrf ~/.dotFiles/.oh-my-zsh ~/
  cp -vrf ~/.dotFiles/.vim ~/
  cp -vrf ~/.dotFiles/.vimrc ~/
  cp -vrf ~/.dotFiles/.zshrc ~/
  cp -vrf ~/.dotFiles/.notes ~/
  #cp -rf ~/.dotFiles/. ~/

  ~/.fonts/install.sh
  #fc-cache -f -v
}

main "${@}"

