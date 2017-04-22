#!/usr/bin/env bash

BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "$BASEDIR"

# Prep folders
mkdir -p $BASEDIR/.dotfiles/local

# Enter sudo
sudo -v

# If the platform is Linux, try an apt-get to install zsh and then recurse
if [ $platform == 'Linux' ]; then
  if [ -f /etc/debian_version ]; then
    ./linux/setup.sh
  fi

# If the platform is OS X, tell the user to install zsh :)
elif [ $platform == 'Darwin' ]; then
  ./osx/setup.sh
fi
