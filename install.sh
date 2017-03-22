#Author: Sebastiaan Van Hoecke

check_installed_software(){

  echo "Have you installed vim, tmux, zsh, git and conky?' [Y/n]"
  read -r answer

  if [[ $answer = "n" ]]
  then
    exit 2
  fi
}

install_configs(){

  rm -ivr ~/.dotFiles
  rm -ivr ~/.fonts

  env git clone --depth=1 https://github.com/sevaho/dotFiles.git ~/.dotFiles || {
    printf "Error: git clone of dotFiles\n"
    exit 1
  }

  env git clone --depth=1 https://github.com/powerline/fonts.git  ~/.fonts || {
    printf "Error: git clone of fonts\n"
    exit 1
  }

  #VIM plugins

  #ZSH plugins

  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" 

  env git clone --depth=1 git://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions || {
    printf "Error: git clone of zsh autosuggest\n"
    exit 1
  }

  env git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting || {
    printf "Error: git clone of zsh syntax highlight\n"
    exit 1
  }

  cp -vrf ~/.dotFiles/.conkyrc ~/
  cp -vrf ~/.dotFiles/.conkyrc_for_i3_right ~/
  cp -vrf ~/.dotFiles/.conkyrc_for_i3_left ~/
  cp -vrf ~/.dotFiles/.bashrc ~/
  cp -vrf ~/.dotFiles/.tmux.conf ~/
  cp -vrf ~/.dotFiles/.vim/colors ~/.vim/
  cp -vrf ~/.dotFiles/.vim/plugin ~/.vim/
  cp -vrf ~/.dotFiles/.vim/templates ~/.vim/
  cp -vrf ~/.dotFiles/.vim/ftdetect ~/.vim/
  cp -vrf ~/.dotFiles/.vimrc ~/
  cp -vrf ~/.dotFiles/.zshrc ~/
  cp -vrf ~/.dotFiles/.gitignore_global ~/
  cp -vrf ~/.dotFiles/.config/* ~/.config
  cp -vrf ~/.dotFiles/.Xresources ~/
  cp -vrf ~/.dotFiles/.gtkrc-2.0 ~/
  cp -vrf ~/.dotFiles/fonts/* ~/.fonts
  #cp -rf ~/.dotFiles/. ~/

  ~/.fonts/install.sh
  fc-cache -f -v

  echo "source .zshrc"
  sleep 5
}

main(){

  check_installed_software
  install_configs
}

main "${@}"

