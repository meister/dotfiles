#!/usr/bin/env bash

# Python tools
install_python_tools() {
  if [ -n "$(command -v pip)" ]; then
    sudo pip install --upgrade pip
    sudo pip install --upgrade Pygments
    pip completion --zsh > "${BASEDIR}/local/pip-completion.zsh"
  fi
}

# Install Python tools + updated Vim
install_python_tools