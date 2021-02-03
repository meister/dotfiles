#!/usr/bin/env bash

set -e

cd "${BASEDIR}/linux"

# Install VS Code from AUR
# if command -v yaourt; then
#   yaourt -Syu --aur visual-studio-code

#   # shellcheck source=linux/gnome/install-launcher.sh
#   source "${BASEDIR}/linux/gnome/install-launcher.sh" visual-studio-code
# fi

# Install any missing packages:
# - Node.JS with NPM
# - Python PIP
# - VIM
# - Zsh
sudo pacman -S \
  nodejs npm \
  python-pip \
  vscode \
  vim \
  zsh


# Install fonts
# shellcheck source=scripts/install-fonts.sh
(source "${BASEDIR}/scripts/install-fonts.sh")

# Install NVM
# shellcheck source=scripts/install-nvm.sh
(source "${BASEDIR}/scripts/install-nvm.sh")

# Configure terminal
# shellcheck source=linux/install-terminal-themes.sh
(source "${BASEDIR}/linux/install-terminal-themes.sh")

# Configure Zsh
# shellcheck source=zsh/configure.sh
(source "${BASEDIR}/zsh/configure.sh")

# Configure VIM
# shellcheck source=editors/vim/configure.sh
(source "${BASEDIR}/editors/vim/configure.sh")

# Open new Gnome Terminal
gnome-terminal --tab --profile=snazzyfied

echo -e "${COLOR_GREEN}----------------------------------------------------------${COLOR_END}"
echo -e "${COLOR_GREEN}All done! If all went well, Zsh is running in another tab.${COLOR_END}"
echo -e "${COLOR_GREEN}If not, try restarting the terminal.                      ${COLOR_END}"
echo -e "${COLOR_GREEN}----------------------------------------------------------${COLOR_END}"