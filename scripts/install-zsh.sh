#!/usr/bin/env bash

# Enter sudo
sudo -v

install_zsh () {
  echo "We'll install zsh, then re-run Zsh configuration script!"

  # If zsh isn't installed, get the platform of the current machine
  platform=$(uname);

  # If the platform is Linux, try an apt-get to install zsh and then recurse
  if [[ $platform == 'Linux' ]]; then
    if [[ -f /etc/arch-release ]]; then
      sudo pacman -S zsh
      install_zsh
    fi

    if [[ -f /etc/debian_version ]]; then
      sudo apt-get install -y zsh
      install_zsh
    fi

    # Configure for Solus OS (install in system step)
    if [[ -f /etc/solus-release ]]; then
      sudo eopkg install zsh
      install_zsh
    fi

  # If the platform is OS X, tell the user to install zsh :)
  elif [[ $platform == 'Darwin' ]]; then
    brew install zsh zsh-completions
  fi
}

install_zsh
