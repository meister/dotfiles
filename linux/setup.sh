#!/usr/bin/env bash

# Update lists
sudo apt-get update

# Apt source for NodeJS
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -

# Apt source for VS Code
if [ ! -f /etc/apt/sources.list.d/vscode.list ]; then
  curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
  sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
  sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
fi

# Apt source for Chrome
if [ ! -f /etc/apt/sources.list.d/google.list ]; then
  wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
  sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
fi

# Install tools from APT
sudo apt-get install -y \
  git-all \
  nodejs \
  code \
  google-chrome-stable

# Install NVM
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | bash

# Add dock icons
echo "[PlankDockItemPreferences]\nLauncher=file:///usr/share/applications/code.desktop" >  ~/.config/plank/dock1/launchers/code.dockitem
echo "[PlankDockItemPreferences]\nLauncher=file:///usr/share/applications/google-chrome.desktop" > ~/.config/plank/dock1/launchers/google-chrome.dockitem