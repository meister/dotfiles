#!/usr/bin/env bash

# Configure Pantheon
# shellcheck source=terminals/pantheon/configure.sh
[[ -x $(command -v pantheon-terminal) ]] && source "${BASEDIR}/terminals/pantheon/configure.sh"

# Configure Gnome Terminal
# shellcheck source=terminals/gnome-terminal/configure.sh
[[ -x $(command -v gnome-terminal) ]] && source "${BASEDIR}/terminals/gnome-terminal/configure.sh"
