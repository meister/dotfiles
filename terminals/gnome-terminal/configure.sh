#!/usr/bin/env bash

PROFILE_NAME="snazzyfied"
PROFILE_UUID="a646dae7-3c4c-4abf-b34e-763a2ac1abd6"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
OS="${1}"
COLOR_PROFILE="${DIR}/snazzyfied.profile"
BASE_KEY="/org/gnome/terminal/legacy/profiles:"

if [ -f "${COLOR_PROFILE}.${OS}" ]; then
  COLOR_PROFILE="${COLOR_PROFILE}.${OS}"
fi

profile_exists() {
  local key
  local no_exist
  local entries

  no_exist=1
  key="${BASE_KEY}/list"

  # awk '!x[$0]++' -- magical dedupe
  entries="$(
    dconf read "${key}" | tr -d "[]' " | tr , "\n" | awk '!x[$0]++'
  )"
  mapfile -t entries_arr <<< "${entries}"


  for uuid in "${entries_arr[@]}"
  do
    local name
    name=$(dconf read "${BASE_KEY}/:${uuid}/visible-name")

    if [ "${name}" = "'${PROFILE_NAME}'" ]; then
      no_exist=0
      PROFILE_UUID="${uuid}"
    fi
  done

  return $no_exist
}

add_profile() {
  local key
  local no_exist
  local new_list

  key="${BASE_KEY}/list"

  new_list="$(
    {
      dconf read "${key}" | tr -d "[] " | tr , "\n"
      echo "'${PROFILE_UUID}'"
    } | awk '!x[$0]++' | head -c-1 | tr "\n" ,
  )"

  dconf write "${BASE_KEY}"/list "[${new_list}]"
}

if profile_exists; then
  echo "Profile exists. Updating."
  # Reset existing profile
  dconf reset -f "${BASE_KEY}"/:"${PROFILE_UUID}"/
else
  echo "Profile does not exist. Adding new profile."
  add_profile
fi

# Import profile
dconf load "${BASE_KEY}"/ < "${COLOR_PROFILE}"

# Set as default profile
dconf write "${BASE_KEY}"/default "'${PROFILE_UUID}'"
