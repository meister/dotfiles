#!/usr/bin/env bash

set -e

cd $BASEDIR/linux

# Install VS Code from AUR
yaourt -Syu --devel --aur visual-studio-code

# Install missing packages
sudo pacman -S \
  # Install Node.JS
  nodejs npm \
  # Python PIP
  python-pip \
  # VIM
  vim \
  # Zsh
  zsh


# Install fonts
source ./install-fonts.sh

# Configure Zsh
source $BASEDIR/install-zsh.sh