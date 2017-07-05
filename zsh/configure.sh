#!/usr/bin/env bash

set -e

# Configure or Install?
INSTALL=true
if [ "${ZSH_CONFIG_TYPE}" == "configure" ]; then
  INSTALL=false
fi

# Prep folders
mkdir -p $BASEDIR/.dotfiles/local

# Enter sudo
sudo -v

# Install zsh
install_zsh () {
  # Test to see if zshell is installed.  If it is:
  if [ -f /bin/zsh -o -f /usr/bin/zsh ]; then
    # Set the default shell to zsh if it isn't currently set to zsh
    if [[ ! $(echo $SHELL) == $(which zsh) ]]; then
      chsh -s $(which zsh)
      echo "Set the default shell to Zsh"
    fi

  else
    # If zsh isn't installed, get the platform of the current machine
    platform=$(uname);

    # If the platform is Linux, try an apt-get to install zsh and then recurse
    if [[ $platform == 'Linux' ]]; then
      # @TODO: Remove install to Linux setup
      if [[ -f /etc/redhat-release ]]; then
        sudo yum install zsh
        install_zsh
      fi

      # Remove Zsh install for Arch Linux, as it’s under Linux setup
      if [[ -f /etc/arch-release ]]; then
        install_zsh
      fi

      # @TODO: Remove install to Linux setup
      if [[ -f /etc/debian_version ]]; then
        sudo apt-get install -y zsh
        install_zsh
      fi

    # If the platform is OS X, tell the user to install zsh :)
    elif [[ $platform == 'Darwin' ]]; then
      echo "We'll install zsh, then re-run this script!"
      # @TODO: Remove install to Linux setup, instead use the set default shell
      brew install zsh zsh-completions
      exit
    fi

  fi
}

# Python tools
install_python_tools() {
  if [ ! -z `command -v pip` ]; then
    sudo pip install --upgrade pip
    sudo pip install --upgrade Pygments
    pip completion --zsh > $BASEDIR/local/pip-completion.zsh
  fi
}

if $INSTALL; then
  install_zsh
fi

# Link zsh configs
[ -f ~/.zshrc ] && mv ~/.zshrc ~/.zshrc-`date "+%Y-%m-%d_%H:%M:%S"`
[ -h ~/.zshrc ] && rm ~/.zshrc

echo $BASEDIR/zsh/zshrc

ln -s $BASEDIR/zsh/zshrc ~/.zshrc

# Install Python tools + updated Vim
install_python_tools