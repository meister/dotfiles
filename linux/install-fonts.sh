mkdir -p ~/.local/share/fonts

cd ~/.local/share/fonts

cp $BASEDIR/fonts/* .

# DroidSansMonoForPowerline Nerd Font
curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20for%20Powerline%20Nerd%20Font%20Complete.otf

# SourceCodePro Nerd Font
curl -fLo "Source Code Pro Nerd Font Complete.ttf" https://raw.github.com/ryanoasis/nerd-fonts/master/patched-fonts/SourceCodePro/Regular/complete/Sauce%20Code%20Pro%20Nerd%20Font%20Complete.ttf

# RobotoMonoForPowerline Nerd Font
curl -fLo "Roboto Mono Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/RobotoMono/complete/Roboto%20Mono%20Nerd%20Font%20Complete.ttf

fc-cache -f -v