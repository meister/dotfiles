#!/usr/bin/env bash

mkdir -p ~/.local/share/fonts

cd ~/.local/share/fonts

# InputMonoNarrow Nerd Font
cp $BASEDIR/fonts/* .

# DroidSansMonoForPowerline Nerd Font
curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf

# SourceCodePro Nerd Font
curl -fLo "Source Code Pro Nerd Font Complete.ttf" https://raw.github.com/ryanoasis/nerd-fonts/master/patched-fonts/SourceCodePro/Regular/complete/Sauce%20Code%20Pro%20Nerd%20Font%20Complete.ttf

# RobotoMonoForPowerline Nerd Font
curl -fLo "Roboto Mono Nerd Font Complete.ttf" https://raw.github.com/ryanoasis/nerd-fonts/master/patched-fonts/RobotoMono/complete/Roboto%20Mono%20Nerd%20Font%20Complete.ttf

# Fonts with ligatures
curl -fLo "FiraCode_1.204.zip" https://github.com/tonsky/FiraCode/releases/download/1.204/FiraCode_1.204.zip && unzip FiraCode_1.204.zip && rm FiraCode_1.204.zip

fc-cache -f -v