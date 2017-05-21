#!/usr/bin/env bash

LAUNCHER_NAME="${1}"

launcher_exists() {
  LAUNCHERS=$(dconf read /org/gnome/shell/)

  if [[ "${LAUNCHERS}" == *"${LAUNCHER_NAME}"* ]]; then
    return 0
  fi

  return 1
}

add_launcher() {
  if [ "${LAUNCHERS}" == "" ]; then
    NEW_LIST="['${LAUNCHER_NAME}.desktop']"
  else
    NEW_LIST="${LAUNCHERS/\]/,'${LAUNCHER_NAME}.desktop']}"
  fi

  dconf write /org/gnome/shell/favorite-apps "${NEW_LIST}"
}

if launcher_exists -eq 0; then
  echo "Shortcut exists."
else
  echo "Shortcut does not exist. Adding new shortcut."
  add_launcher
fi