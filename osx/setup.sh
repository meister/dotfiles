#!/usr/bin/env bash

# iTerm configuration
if [[ -d /Applications/iTerm.app ]]; then
  ln -s $BASEDIR/terminals/iterm/Zsh.json "$BASEDIR/Library/Application Support/iTerm2/DynamicProfiles"
fi

# Don’t display the annoying prompt when quitting iTerm
defaults write com.googlecode.iterm2 PromptOnQuit -bool false

# Install fonts
sudo cp $BASEDIR/fonts/* /Library/Fonts/

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install NVM
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | bash

# Install Zsh
source $BASEDIR/install-zsh.sh