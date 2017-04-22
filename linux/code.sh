if [ ! -f /etc/apt/sources.list.d/vscode.list ]; then
  curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
  sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
  sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
fi

sudo apt-get update
sudo apt-get install -y code # or code-insiders

echo "[PlankDockItemPreferences]\nLauncher=file:///usr/share/applications/code.desktop" >  ~/.config/plank/dock1/launchers/code.dockitem