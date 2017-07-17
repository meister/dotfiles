#!/usr/bin/env bash

if [ "$PLATFORM" == "Darwin" ]; then
  if [ -d "/Applications/Visual Studio Code.app" ]; then
    echo "Visual Studio Code already exists... skipping."
    if [ -z "$(command -v code)" ]; then
      sudo ln -s "/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code" /usr/local/bin/code
    fi
  else
    curl -L "https://go.microsoft.com/fwlink/?LinkID=620882" | tar -xf - -C $BASEDIR/local
    cp -R "${BASEDIR}/local/Visual Studio Code.app" "/Applications/Visual Studio Code.app"
  fi
fi
