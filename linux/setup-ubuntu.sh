#!/usr/bin/env bash

cd $BASEDIR/linux

# Apt source for VS Code
if [ ! -f /etc/apt/sources.list.d/vscode.list ]; then
  curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
  sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
  sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
fi

# Apt source for Chrome
# if [ ! -f /etc/apt/sources.list.d/google.list ]; then
#    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
#    sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
# fi

# Update lists
# sudo apt-get update

# Apt source for NodeJS (this will run `sudo apt-get update` internally)
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -

# Install tools from APT
sudo apt-get install -y \
  git \
  nodejs \
  python-pip \
  code \
  google-chrome-stable \
  # For add-apt-repository
  software-properties-common \
  python-software-properties

sudo add-apt-repository ppa:jonathonf/vim
sudo apt update
sudo apt install -y vim

# Install NVM
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | bash

# Add dock icons
# Google Chrome
printf "[PlankDockItemPreferences]\nLauncher=file:///usr/share/applications/google-chrome.desktop" > ~/.config/plank/dock1/launchers/google-chrome.dockitem
# VS Code
printf "[PlankDockItemPreferences]\nLauncher=file:///usr/share/applications/code.desktop" >  ~/.config/plank/dock1/launchers/code.dockitem

# Install fonts
(source $BASEDIR/fonts/install.sh)

# Configure terminal themes
(source ./install-terminal-themes.sh)

# Install Zsh
(source $BASEDIR/zsh/configure.sh)

# Configure VIM
(source $BASEDIR/editors/vim/configure.sh)

# Configure VS Code
(source $BASEDIR/editors/vscode/configure.sh)

# Clean up
sudo apt autoremove

echo -e "${COLOR_GREEN}----------------------------------------------------------${COLOR_END}"
echo -e "${COLOR_GREEN}All done! If all went well, Zsh is running in another tab.${COLOR_END}"
echo -e "${COLOR_GREEN}----------------------------------------------------------${COLOR_END}"