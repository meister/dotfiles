#!/usr/bin/env bash

PROFILE_UUID="a646dae7-3c4c-4abf-b34e-763a2ac1abd6"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
OS="${1}"
COLOR_PROFILE="${DIR}/snazzyfied.profile"

if [ -f "${COLOR_PROFILE}.${OS}" ]; then
  COLOR_PROFILE="${COLOR_PROFILE}.${OS}"
fi

profile_exists() {
  PROFILES=$(dconf read /org/gnome/terminal/legacy/profiles:/list)
  # PROFILES="['asd']"
  # PROFILES="['a646dae7-3c4c-4abf-b34e-763a2ac1abd6']"

  if [[ "${PROFILES}" == *"${PROFILE_UUID}"* ]]; then
    return 0
  fi

  return 1
}

add_profile() {
  if [ "${PROFILES}" == "" ]; then
    NEW_LIST="['${PROFILE_UUID}']"
  else
    NEW_LIST="${PROFILES/\]/,'${PROFILE_UUID}']}"
  fi

  dconf write /org/gnome/terminal/legacy/profiles:/list "${NEW_LIST}"
}

# Reset existing profile
dconf reset -f /org/gnome/terminal/legacy/profiles:/:${PROFILE_UUID}/

if profile_exists -eq 0; then
  echo "Profile exists. Updating."
else
  echo "Profile does not exist. Adding new profile."
  add_profile
fi

# Import profile
dconf load /org/gnome/terminal/legacy/profiles:/ < ${COLOR_PROFILE}

# Set as default profile
dconf write /org/gnome/terminal/legacy/profiles:/default "'${PROFILE_UUID}'"
