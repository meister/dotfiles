#!/usr/bin/env bash

set -e

# Test to see if zshell is installed.  If it is:
if [ -f /bin/zsh ] || [ -f /usr/bin/zsh ] || [ -f /usr/local/bin/zsh ]; then
  # Set the default shell to zsh if it isn't currently set to zsh
  if [[ ! "${SHELL}" == "$(which zsh)" ]]; then
    sudo chsh -s "$(which zsh)" "${USER}"
    echo "Set the default shell to Zsh"
  fi
else
  echo "Could not find zsh on your system. If it’s missing, you can install it by running setup with \`--install-zsh\`"
  exit 21
fi

# Link zsh configs
[ -f ~/.zshrc ] && mv ~/.zshrc "${HOME}/.zshrc-$(date "+%Y-%m-%d_%H:%M:%S")"
[ -h ~/.zshrc ] && rm ~/.zshrc

echo "${BASEDIR}/zsh/zshrc"

ln -s "${BASEDIR}/zsh/zshrc" ~/.zshrc

# Add additional Python tools (for VIM and ZSH)
# shellcheck source=scripts/install-python-tools.sh
(source "${BASEDIR}/scripts/install-python-tools.sh")