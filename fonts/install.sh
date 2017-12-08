#!/usr/bin/env bash

CWD=$(pwd)
PLATFORM=$(uname -s)

# Download free fonts from the net
mkdir -p $BASEDIR/local/fonts
cd $BASEDIR/local/fonts

# DroidSansMonoForPowerline Nerd Font
curl -fLo "Droid Sans Mono Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
# SourceCodePro Nerd Font
curl -fLo "Source Code Pro Nerd Font Complete.ttf" https://raw.github.com/ryanoasis/nerd-fonts/master/patched-fonts/SourceCodePro/Regular/complete/Sauce%20Code%20Pro%20Nerd%20Font%20Complete.ttf
# RobotoMonoForPowerline Nerd Font
curl -fLo "Roboto Mono Nerd Font Complete.ttf" https://raw.github.com/ryanoasis/nerd-fonts/master/patched-fonts/RobotoMono/complete/Roboto%20Mono%20Nerd%20Font%20Complete.ttf
# Fonts with ligatures
if [ ! -f "FiraCode_1.204.zip" ]; then
  curl -fLo "FiraCode_1.204.zip" https://github.com/tonsky/FiraCode/releases/download/1.204/FiraCode_1.204.zip
  mkdir -p firacode
  unzip FiraCode_1.204.zip -d firacode
fi

# Install fonts
if [ "${PLATFORM}" == "Darwin" ]; then
  sudo cp $BASEDIR/fonts/* /Library/Fonts/
  sudo cp $BASEDIR/local/fonts/*.ttf /Library/Fonts/
  sudo cp $BASEDIR/local/fonts/firacode/ttf/*.ttf /Library/Fonts/
else
  mkdir -p ~/.local/share/fonts
  cd ~/.local/share/fonts

  # InputMonoNarrow Nerd Font
  cp $BASEDIR/fonts/*.ttf ~/.local/share/fonts/
  cp $BASEDIR/local/fonts/*.otf ~/.local/share/fonts/
  cp $BASEDIR/local/fonts/*.ttf ~/.local/share/fonts/
  cp $BASEDIR/local/fonts/firacode/ttf/*.ttf ~/.local/share/fonts/

  # Clear cache
  fc-cache -f -v
fi

cd $CWD