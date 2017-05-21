#!/usr/bin/env bash

# Configure Pantheon
[[ -x `command -v pantheon-terminal` ]] && source $BASEDIR/terminals/pantheon/configure.sh

# Configure Gnome Terminal
[[ -x `command -v gnome-terminal` ]] && source $BASEDIR/terminals/gnome-terminal/configure.sh
