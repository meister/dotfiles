#!/usr/bin/env bash

if [ "$PLATFORM" == "Darwin" ]; then
  if [ -d "/Applications/Visual Studio Code.app" ]; then
    echo "Visual Studio Code already exists... skipping."
  else
    curl -L "https://go.microsoft.com/fwlink/?LinkID=620882" | tar -xf - -C $BASEDIR/local
    cp -R "${BASEDIR}/local/Visual Studio Code.app" "/Applications/Visual Studio Code.app"
  fi
fi
