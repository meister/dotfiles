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

    if [ -d ~/.dotfiles ]; then
      if [ ! -d ~/.dotfiles/.git ]; then
        mv ~/.dotfiles ~/.dotfiles_backup
        echo "Backed up previous dotfiles to ~/.dotfiles_backup"
        git clone --recursive https://github.com/meister/dotfiles ~/.dotfiles
      else
        echo "Pulling updates to existing ~/.dotfiles"
        (cd ~/.dotfiles && git pull)
      fi
    else
      echo "Installing dotfiles"
      git clone --recursive https://github.com/meister/dotfiles ~/.dotfiles
    fi

    if [ -d ~/.antidote ]; then
      if [ ! -d ~/.antidote/.git ]; then
        mv ~/.antidote ~/.antidote_backup
        echo "Backed up previous antidote to ~/.antidote_backup"
        git clone --depth=1 https://github.com/mattmc3/antidote.git ~/.antidote
      else
        echo "Pulling updates to existing ~/.antidote"
        (cd ~/.antidote && git pull)
      fi
    else
      echo "Installing antidote"
      git clone --depth=1 https://github.com/mattmc3/antidote.git ~/.antidote
    fi
  else
    echo -e "${COLOR_WHITE}Using ${CMD} to download scripts${COLOR_END}"
    if [ -d ~/.dotfiles ]; then
      mv ~/.dotfiles ~/.dotfiles_backup
      echo "Backed up previous dotfiles to ~/.dotfiles_backup"
    fi

    mkdir -p ~/.dotfiles
    eval "${CMD} https://github.com/meister/dotfiles/tarball/master | tar -xzv -C ~/.dotfiles --strip-components=1 --exclude='{.gitignore}'"
    eval "${CMD} https://github.com/mattmc3/antidote/tarball/master | tar -xzv -C ~/.antidote --strip-components=1 --exclude='{.gitignore}'"
  fi

  # shellcheck source=setup.sh
  source ~/.dotfiles/setup.sh
fi
