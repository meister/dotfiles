#!/usr/bin/env bash

set -e

cd $BASEDIR/linux

# Install VS Code from AUR
yaourt -Syu --aur visual-studio-code

(source ./gnome/install-launcher.sh visual-studio-code)

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
(source $BASEDIR/fonts/install.sh)

# Configure Zsh
(source $BASEDIR/zsh/configure.sh)

# Configure terminal
(source ./install-terminal-themes.sh)

# Open new Gnome Terminal
# gnome-terminal --tab --profile=snazzyfied

echo -e "${COLOR_GREEN}----------------------------------------------------------${COLOR_END}"
echo -e "${COLOR_GREEN}All done! If all went well, Zsh is running in another tab.${COLOR_END}"
echo -e "${COLOR_GREEN}----------------------------------------------------------${COLOR_END}"