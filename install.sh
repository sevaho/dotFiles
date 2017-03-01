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

  curl -sL https://raw.githubusercontent.com/egalpin/apt-vim/master/install.sh | sh
  echo "install vim plugins manually"
  sleep 5
#  apt-vim install -y https://github.com/scrooloose/nerdtree.git
#  apt-vim install -y https://github.com/jiangmiao/auto-pairs.git
#  apt-vim install -y https://github.com/vim-airline/vim-airline.git
#  apt-vim install -y https://github.com/vim-airline/vim-airline-themes.git
#  apt-vim install -y https://github.com/pangloss/vim-javascript.git
#  apt-vim install -y https://github.com/digitaltoad/vim-pug.git
#  apt-vim install -y https://github.com/vim-syntastic/syntastic.git
#  apt-vim install -y https://github.com/Valloric/YouCompleteMe.git
#  apt-vim install -y https://github.com/airblade/vim-gitgutter.git
#  mkdir -p ~/.vim/autoload ~/.vim/bundle && \
#  curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

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
  cp -vrf ~/.dotFiles/.bashrc ~/
  cp -vrf ~/.dotFiles/.tmux.conf ~/
  cp -vrf ~/.dotFiles/.vim/colors ~/.vim/
  cp -vrf ~/.dotFiles/.vim/plugin ~/.vim/
  cp -vrf ~/.dotFiles/.vim/templates ~/.vim/
  cp -vrf ~/.dotFiles/.vim/ftdetect ~/.vim/
  cp -vrf ~/.dotFiles/.vimrc ~/
  cp -vrf ~/.dotFiles/.zshrc ~/
  cp -rf ~/.dotFiles/.gitignore_global ~/
  #cp -rf ~/.dotFiles/. ~/

  ~/.fonts/install.sh
  fc-cache -f -v

  echo "source .zshrc"
  sleep 5
}

main "${@}"

