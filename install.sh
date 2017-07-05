#!/usr/bin/env bash

[[ -x `command -v wget` ]] && CMD="wget --no-check-certificate -O -"
[[ -x `command -v curl` ]] >/dev/null 2>&1 && CMD="curl -#L"

function has_git() {
  if [[ -x `command -v git` ]]; then
    if `git --version`; then
      exit 0
    fi
  fi

  exit 1
}

if [ -z "$CMD" ]; then
  echo "No curl or wget available. Aborting."
else
  echo "Installing dotfiles"

  if [ -d ~/.dotfiles ]; then
    mv ~/.dotfiles ~/.dotfiles_backup
  fi

  if has_git; then
    eval "git clone --recursive https://github.com/meister/dotfiles ~/.dotfiles"
  else
    mkdir -p ~/.dotfiles
    eval "$CMD https://github.com/meister/dotfiles/tarball/master | tar -xzv -C ~/.dotfiles --strip-components=1 --exclude='{.gitignore}'"
  fi

  source ~/.dotfiles/setup.sh
fi