#!/usr/bin/env bash

set -e

cd $BASEDIR/linux

# Install VS Code from AUR
yaourt -Syu --aur visual-studio-code

# Install any missing packages:
# - Node.JS with NPM
# - Python PIP
# - VIM
# - Zsh
sudo pacman -S \
  nodejs npm \
  python-pip \
  vim \
  zsh


# Install fonts
source ./install-fonts.sh

# Configure terminal
source ./install-terminal-themes.sh

# Configure Zsh
source $BASEDIR/install-zsh.sh

# Open new Gnome Terminal
gnome-terminal