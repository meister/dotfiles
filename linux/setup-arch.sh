#!/usr/bin/env bash

cd $BASEDIR/linux

# Install missing packages
pacman -S \
  # Microsoft VS Code
  visual-studio-code \
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