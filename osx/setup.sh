#!/usr/bin/env bash

# iTerm configuration
if [ -d /Applications/iTerm.app ]; then
  cp "${BASEDIR}/terminals/iterm/Snazzyfied.json" "${HOME}/Library/Application Support/iTerm2/DynamicProfiles"
fi

# Don’t display the annoying prompt when quitting iTerm
defaults write com.googlecode.iterm2 PromptOnQuit -bool false

# Install fonts
# shellcheck source=scripts/install-fonts.sh
(source "${BASEDIR}/scripts/install-fonts.sh")

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install VS Code
# shellcheck source=editors/vscode/install.sh
(source "${BASEDIR}/editors/vscode/install.sh")

# Install NVM
# shellcheck source=scripts/install-nvm.sh
(source "${BASEDIR}/scripts/install-nvm.sh")

# Install latest VIM
brew install vim --with-override-system-vim

zsh_packages="zsh-completions"
os_ver=${1-:$(sw_vers -productVersion)}
if [[ "$os_ver" == :10.15.* ]] || [[ "$os_ver" == :11.* ]]; then
	echo "macOS should have Zsh by default. Skip install."
else
	zsh_packages="zsh zsh-completions"
fi

# Install Zsh
brew install "$zsh_packages"

# Configure Zsh
# shellcheck source=zsh/configure.sh
(source "${BASEDIR}/zsh/configure.sh")

echo -e "${COLOR_GREEN}-----------------------------------------------------${COLOR_END}"
echo -e "${COLOR_GREEN}All done! Installed fonts, VS Code, NVM, Vim and Zsh.${COLOR_END}"
echo -e "${COLOR_GREEN}-----------------------------------------------------${COLOR_END}"