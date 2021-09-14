#!/usr/bin/env bash

BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
export BASEDIR

# Libs
# shellcheck source=libs/colors.sh
source "${BASEDIR}/libs/colors.sh"

set -e

[[ -x $(command -v wget) ]] && CMD="wget --no-check-certificate -O -"
[[ -x $(command -v curl) ]] >/dev/null 2>&1 && CMD="curl -#L"

function has_git() {
  if [[ -x $(command -v git) ]]; then
    if git --version >/dev/null 2>&1; then
      return 0
    fi
  fi

  return 1
}

if [ -z "${CMD}" ]; then
  echo -e "${COLOR_RED}No curl or wget available. Aborting.${COLOR_END}"
else
  echo -e "${COLOR_YELLOW}Installing dotfiles${COLOR_END}"

  if has_git; then
    echo -e "${COLOR_WHITE}Using Git to download scripts${COLOR_END}"

    CMD="git clone --recursive https://github.com/meister/dotfiles ~/.dotfiles"

    if [ -d ~/.dotfiles ]; then
      if [ ! -d ~/.dotfiles/.git ]; then
        mv ~/.dotfiles ~/.dotfiles_backup
        echo "Backed up previous dotfiles to ~/.dotfiles_backup"
      else
        echo "Pulling updates to existing ~/.dotfiles"
        CMD="(cd ~/.dotfiles && git pull --recurse-submodules)"
      fi
    fi

    eval "${CMD}"
  else
    echo -e "${COLOR_WHITE}Using ${CMD} to download scripts${COLOR_END}"
    if [ -d ~/.dotfiles ]; then
      mv ~/.dotfiles ~/.dotfiles_backup
      echo "Backed up previous dotfiles to ~/.dotfiles_backup"
    fi

    mkdir -p ~/.dotfiles
    eval "${CMD} https://github.com/meister/dotfiles/tarball/master | tar -xzv -C ~/.dotfiles --strip-components=1 --exclude='{.gitignore}'"
    eval "${CMD} https://github.com/zsh-users/antigen/tarball/master | tar -xzv -C ~/.dotfiles/antigen --strip-components=1 --exclude='{.gitignore}'"
  fi

  # shellcheck source=setup.sh
  source ~/.dotfiles/setup.sh
fi
