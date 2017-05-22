#!/usr/bin/env bash

export BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
export PLATFORM=$(uname)

# Prep folders
mkdir -p $BASEDIR/local

cd $BASEDIR

# Enter sudo
sudo -v

configure_system() {
  # If the platform is Linux, try an apt-get to install zsh and then recurse
  if [[ $PLATFORM == 'Linux' ]]; then
    if [ -f /etc/debian_version ]; then
      ./linux/setup.sh
    elif [ -f /etc/arch-release ]; then
      ./linux/setup-arch.sh
    else
      echo "Your Linux distribution is not supported at this moment."
      echo "Th script needs an Ubuntu based distro or macOS for now."
      exit 1
    fi

  # If the platform is OS X, tell the user to install zsh :)
  elif [[ $PLATFORM == 'Darwin' ]]; then
    ./osx/setup.sh
  fi
}

configure_vim() {
  source ./editors/vim/configure.sh
}

configure_vscode() {
  source ./editors/vscode/configure.sh
}

case "${1}" in
  "system")
    configure_system
    exit 0
    ;;

  "vim")
    configure_vim
    exit 0
    ;;

  "vscode")
    configure_vscode
    exit 0
    ;;

  *)
    configure_system
    configure_vim
    configure_vscode
    ;;
esac
