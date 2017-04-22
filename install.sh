#!/usr/bin/env bash

[ -x `command -v wget` ] && CMD="wget --no-check-certificate -O -"
[ -x `command -v curl` ] >/dev/null 2>&1 && CMD="curl -#L"

if [ -z "$CMD" ]; then
  echo "No curl or wget available. Aborting."
else
  echo "Installing dotfiles"

  if [ -d ~/.dotfiles ]; then
    mv ~/.dotfiles ~/.dotfiles_backup
  fi

  mkdir -p ~/.dotfiles

  if [ -x `command -v git` ]; then
    eval "cd ~/.dotfiles && git clone https://github.com/meister/dotfiles"
  else
    eval "$CMD https://github.com/meister/dotfiles/tarball/master | tar -xzv -C ~/.dotfiles --strip-components=1 --exclude='{.gitignore}'"
  fi

  source ~/.dotfiles/setup.sh
fi