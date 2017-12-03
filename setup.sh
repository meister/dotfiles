#!/usr/bin/env bash

export BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
export PLATFORM="$(uname -s)"

# Test for args
args="${*}"
arg() { [[ "${args}" ==  *"--${1}"* ]]; }

# Prep folders
mkdir -p $BASEDIR/local

cd $BASEDIR || exit 1

# Enter sudo
sudo -v

no_command=true

configure_system() {
  no_command=false

  # If the platform is Linux, try an apt-get to install zsh and then recurse
  if [[ $PLATFORM == "Linux" ]]; then
    if [ -f /etc/debian_version ]; then
      ./linux/setup.sh
    elif [ -f /etc/arch-release ]; then
      ./linux/setup-arch.sh
    elif [ -f /etc/solus-release ]; then
      ./linux/setup-solus.sh
    else
      echo -e "${COLOR_RED}Your Linux distribution is not supported at this moment.${COLOR_END}"
      echo -e "This script needs an Ubuntu or Arch Linux based distro or macOS for now."
      exit 1
    fi

  # If the platform is OS X, tell the user to install zsh :)
  elif [[ $PLATFORM == "Darwin" ]]; then
    ./osx/setup.sh
  fi
}

install_fonts() {
  no_command=false
  source ./fonts/install.sh
}

configure_vim() {
  no_command=false
  source ./editors/vim/configure.sh
}

configure_vscode() {
  no_command=false
  source ./editors/vscode/configure.sh
}

install_zsh() {
  no_command=false
  export ZSH_CONFIG_TYPE="install"
  source ./zsh/configure.sh
}

configure_zsh() {
  no_command=false
  export ZSH_CONFIG_TYPE="configure"
  source ./zsh/configure.sh
}

if arg "system"; then configure_system; fi
if arg "fonts" ; then install_fonts; fi
if arg "vim"   ; then configure_vim; fi
if arg "vscode"; then configure_vscode; fi
if arg "install-zsh"; then install_zsh; fi
if arg "zsh"   ; then configure_zsh; fi

if arg "all"; then
  configure_system
  configure_vim
  configure_vscode
  configure_zsh
fi

if [ $no_command ]; then
  echo "Usage: ${0} [args]"
  echo ""
  echo "Arguments:"
  echo "  --system          Install system tools and fonts"
  echo "  --fonts           Install fonts"
  echo "  --vim             Configure VIM"
  echo "  --vscode          Configure VS Code"
  echo "  --install-zsh     Install and configure ZSH"
  echo "  --zsh             Configure ZSH (does not perform install)"
  echo ""
  echo "Multiple arguments can be supplied."
fi
