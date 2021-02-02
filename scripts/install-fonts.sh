#!/usr/bin/env bash

firaCodeFont="Fira_Code_v5.2.zip"
firaCodeVersion="5.2"

remoteFonts=(
  # Zipped fonts first
  "${firaCodeFont}"
  # Then unzipped
  "Roboto Mono Nerd Font Complete.ttf"
  "Source Code Pro Nerd Font Complete.ttf"
  "Droid Sans Mono Nerd Font Complete.otf"
)

remoteFontUrls=(
  # Zipped fonts first
  "https://github.com/tonsky/FiraCode/releases/download/${firaCodeVersion}/${firaCodeFont}"
  # Then unzipped
  "https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/RobotoMono/Regular/complete/Roboto%20Mono%20Nerd%20Font%20Complete%20Mono.ttf"
  "https://raw.github.com/ryanoasis/nerd-fonts/master/patched-fonts/SourceCodePro/Regular/complete/Sauce%20Code%20Pro%20Nerd%20Font%20Complete.ttf"
  "https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf"
)

CWD=$(pwd)
PLATFORM=$(uname -s)

# Download free fonts from the net
mkdir -p "${BASEDIR}/local/fonts"
cd "${BASEDIR}/local/fonts" || exit 11

# Download and extract fonts
for i in "${!remoteFontUrls[@]}"; do
  fontFile="${remoteFonts[$i]}"
  fontUrl="${remoteFontUrls[$i]}"

  echo "${fontFile}"
  curl -#fLo "${fontFile}" "${fontUrl}"
done

mkdir -p firacode
unzip -o "${firaCodeFont}" -d firacode

# Install fonts
if [ "${PLATFORM}" == "Darwin" ]; then
  cp "${BASEDIR}"/fonts/*.ttf ~/Library/Fonts/
  cp "${BASEDIR}"/local/fonts/*.otf ~/Library/Fonts/
  cp "${BASEDIR}"/local/fonts/*.ttf ~/Library/Fonts/
  cp "${BASEDIR}"/local/fonts/firacode/ttf/*.ttf ~/Library/Fonts/
else
  mkdir -p ~/.local/share/fonts || exit 12
  cd ~/.local/share/fonts || exit 13

  # InputMonoNarrow Nerd Font
  cp "${BASEDIR}"/fonts/*.ttf ~/.local/share/fonts/
  cp "${BASEDIR}"/local/fonts/*.otf ~/.local/share/fonts/
  cp "${BASEDIR}"/local/fonts/*.ttf ~/.local/share/fonts/
  cp "${BASEDIR}"/local/fonts/firacode/ttf/*.ttf ~/.local/share/fonts/

  # Clear cache
  fc-cache -f -v
fi

cd "${CWD}" || return