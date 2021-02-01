#!/usr/bin/env bash

set -e

cd "${BASEDIR}/linux"

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

# Configure VS Code
# shellcheck source=editors/vscode/configure.sh
(source "${BASEDIR}/editors/vscode/configure.sh")

# Open new Gnome Terminal
# gnome-terminal --tab --profile=snazzyfied

echo -e "${COLOR_GREEN}----------------------------------------------------------${COLOR_END}"
echo -e "${COLOR_GREEN}All done! If all went well, Zsh is running in another tab.${COLOR_END}"
echo -e "${COLOR_GREEN}----------------------------------------------------------${COLOR_END}"