#!/usr/bin/bash

if [[ ! -f /etc/apt/sources.list.d/google.list ]]; then
  wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
  sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
fi

sudo apt-get update
sudo apt-get install -y google-chrome-stable

echo "[PlankDockItemPreferences]\nLauncher=file:///usr/share/applications/google-chrome.desktop" > ~/.config/plank/dock1/launchers/google-chrome.dockitem