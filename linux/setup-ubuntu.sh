#!/usr/bin/env bash

cd "${BASEDIR}/linux" || return

update_lists=0

# Apt source for VS Code
if [ ! -f /etc/apt/sources.list.d/vscode.list ]; then
  curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
  sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
  sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
  update_lists=1
fi

# Apt source for Chrome
if [ ! -f /etc/apt/sources.list.d/google.list ]; then
   wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
   sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
   update_lists=1
fi

if [ $update_lists == 1 ]; then
  sudo apt-get update
fi

# Apt source for NodeJS (this will run `sudo apt-get update` internally)
curl -sL https://deb.nodesource.com/setup_lts.x | sudo -E bash -

# Install tools from APT
sudo apt-get install -y \
  git \
  nodejs \
  build-essential \
  python-pip \
  zsh \
  code \
  google-chrome-stable \
  # For add-apt-repository
  software-properties-common

sudo add-apt-repository ppa:jonathonf/vim
sudo apt update
sudo apt install -y vim

# Add dock icons
# Google Chrome
printf "[PlankDockItemPreferences]\nLauncher=file:///usr/share/applications/google-chrome.desktop" > ~/.config/plank/dock1/launchers/google-chrome.dockitem
# VS Code
printf "[PlankDockItemPreferences]\nLauncher=file:///usr/share/applications/code.desktop" >  ~/.config/plank/dock1/launchers/code.dockitem

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

# Configure VS Code
# shellcheck source=editors/vscode/configure.sh
(source "${BASEDIR}/editors/vscode/configure.sh")

# Clean up
sudo apt autoremove

# Open new Gnome Terminal
gnome-terminal --tab --profile=snazzyfied

echo -e "${COLOR_GREEN}----------------------------------------------------------${COLOR_END}"
echo -e "${COLOR_GREEN}All done! If all went well, Zsh is running in another tab.${COLOR_END}"
echo -e "${COLOR_GREEN}----------------------------------------------------------${COLOR_END}"
