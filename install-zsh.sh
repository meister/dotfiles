#!/usr/bin/env bash

BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "$BASEDIR"

# Prep folders
mkdir -p $BASEDIR/.dotfiles/local

# Enter sudo
sudo -v

# Install zsh
install_zsh () {
  # Test to see if zshell is installed.  If it is:
  if [[ -f /bin/zsh -o -f /usr/bin/zsh ]]; then
    # Install Oh My Zsh if it isn't already present
    # if [[ ! -d $BASEDIR/oh-my-zsh/ ]]; then
    #   sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    # fi

    # Set the default shell to zsh if it isn't currently set to zsh
    if [[ ! $(echo $SHELL) == $(which zsh) ]]; then
      chsh -s $(which zsh)
    fi

  else
    # If zsh isn't installed, get the platform of the current machine
    platform=$(uname);

    # If the platform is Linux, try an apt-get to install zsh and then recurse
    if [[ $platform == 'Linux' ]]; then
      if [[ -f /etc/redhat-release ]]; then
        sudo yum install zsh
        install_zsh
      fi

      if [[ -f /etc/debian_version ]]; then
        sudo apt-get install zsh
        install_zsh
      fi

    # If the platform is OS X, tell the user to install zsh :)
    elif [[ $platform == 'Darwin' ]]; then
      echo "We'll install zsh, then re-run this script!"
      brew install zsh zsh-completions
      exit
    fi

  fi
}

install_zsh

# Link zsh configs
if [[ -f ~/.zshrc ]]; then
  mv ~/.zshrc ~/.zshrc-`date "+%Y-%m-%d_%H:%M:%S"`
fi

ln -s $BASEDIR/zsh/zshrc ~/.zshrc

# Install Python tools + updated Vim
pip install --upgrade pip
pip install --upgrade Pygments
pip completion --zsh > $BASEDIR/.dotfiles/local/pip-completion.zsh