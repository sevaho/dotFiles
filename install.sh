#Author: Sebastiaan Van Hoecke

main(){

  check_installed_software
  install_configs
}
check_installed_software(){

  echo "Have you installed vim, tmux, zsh, git and conky?' [Y/n]"
  read -r answer

  if [[ $answer = "n" ]]
  then
    exit 2
  fi
}

install_configs(){

  rm -vrf ~/.dotFiles
  rm -vrf ~/.fonts

  env git clone --depth=1 https://github.com/sevaho/dotFiles.git ~/.dotFiles || {
    printf "Error: git clone of dotFiles\n"
    exit 1
  }

  env git clone --depth=1 https://github.com/powerline/fonts.git  ~/.fonts || {
    printf "Error: git clone of fonts\n"
    exit 1
  }

  cp -vrf ~/.dotFiles/.conkyrc ~/
  cp -vrf ~/.dotFiles/.bashrc ~/
  cp -vrf ~/.dotFiles/.tmux.conf ~/
  #cp -vrf ~/.dotFiles/.oh-my-zsh ~/
  #cp -vrf ~/.dotFiles/.vim ~/
  cp -vrf ~/.dotFiles/.vimrc ~/
  cp -vrf ~/.dotFiles/.zshrc ~/
  cp -vrf ~/.dotFiles/.notes ~/
  cp -rf ~/.dotFiles/.gitignore_global ~/
  #cp -rf ~/.dotFiles/. ~/

  ~/.fonts/install.sh
  fc-cache -f -v

  #VIM plugins

  git clone https://github.com/jeremyFreeAgent/oh-my-zsh-powerline-theme.git
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" 
  curl -sL https://raw.githubusercontent.com/egalpin/apt-vim/master/install.sh | sh
  apt-vim install -y https://github.com/scrooloose/nerdtree.git
  git clone git://github.com/jiangmiao/auto-pairs.git ~/.vim/bundle/auto-pairs 

  #ZSH plugins

  env git clone --depth=1 git://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions || {
    printf "Error: git clone of zsh autosuggest\n"
    exit 1
  }

  env git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting || {
    printf "Error: git clone of zsh syntax highlight\n"
    exit 1
  }

  echo "source .zshrc"
  sleep 5
}

main "${@}"

