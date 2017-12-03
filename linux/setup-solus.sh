#!/usr/bin/env bash

set -e

cd $BASEDIR/linux

# Install any missing packages:
# - VS Code
# - Node.JS with NPM
# - Python PIP
# - Zsh
sudo eopkg install vscode \
  nodejs \
  pip \
  zsh

# Fix missing VS Code symlink
(
  if [ ! -L /usr/bin/code ]; then
    sudo ln -s /usr/share/vscode/bin/code-oss /usr/bin/code
  else
    echo "Symlink for code exists"
  fi
)


# Install fonts
(source $BASEDIR/fonts/install.sh)

# Configure Zsh
(source $BASEDIR/zsh/configure.sh)

# Configure terminal
#(source ./install-terminal-themes.sh)

# Open new Gnome Terminal
# gnome-terminal --tab --profile=snazzyfied

echo -e "${COLOR_GREEN}----------------------------------------------------------${COLOR_END}"
echo -e "${COLOR_GREEN}All done! If all went well, Zsh is running in another tab.${COLOR_END}"
echo -e "${COLOR_GREEN}----------------------------------------------------------${COLOR_END}"