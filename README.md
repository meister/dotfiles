# meister’s dotfiles

This repo contains mainly dotfiles for the terminal and editor setup. This setup is mostly intended
for development environments that use NodeJS and Git heavily. The Zsh theme and NVM setups main
goals are to bring visibility for the developers about the Node versions and Git statuses.

## Note: Current testing status
* [ ] macOS
* [x] ElementaryOS (Loki)
* [ ] Ubuntu 18.04
* [x] Arch Linux
  * [x] Antergos with Gnome desktop
  * [x] Endeavour OS with Gnome desktop
* [x] Solus OS (with Gnome desktop)

## Todo
* [ ] Include [Snazzyfied theme](https://github.com/meister/vim-snazzyfied) for VIM
* [ ] Include [Snazzyfied theme](https://github.com/meister/vscode-snazzyfied) for VS Code
* [x] Update .vimrc to include [Vundle](https://github.com/VundleVim/Vundle.vim) and some of the
  subjectively necessary plugins
* [x] Make install components configurable

## Installation

To install this everything:
```
curl -fsSL https://raw.githubusercontent.com/meister/dotfiles/master/install.sh | bash -s -- --all
```

### Install options

| Arguments           | Description
|---|---
| `--all`             | Install system tools and fonts<br>[Will make OS specific configurations](#system-configurations)
| `--install-zsh`     | Install and configure ZSH
| `--configure-zsh`   | Configure ZSH (if you have it installed)
| `--fonts`           | Install fonts
| `--vim`             | Configure VIM (if you have it installed)
| `--vscode`          | Configure VS Code (if you have it installed)

### Steps in general

Installation consists of installing few components:
* Base tools
* Installing terminal themes & fonts
  * Currently supported: pantheon (default with ElementaryOS) and gnome-terminal
* Installing and configuring [Zsh](http://zsh.sourceforge.net)
* Installing and configuring VIM

## System Configurations

### macOS

On macOS the script will install following tools:
* Homebrew
* Vim 8 (from Homebrew)
* VS Code
* NVM
* Zsh (when *not* on macOS 10.15 or macOS 11)

### Ubuntu based Linux

On Ubuntu the script will add sources and install following packages:
* git
* nodejs (lts)
* python-pip
* vim
* code (VS Code)
* google-chrome-stable

### Arch Linux

On Arch Linux the script will add sources and install following packages:
* nodejs (lts)
* python-pip
* vim
* code (VS Code from AUR, if available)
* zsh

### SolusOS Linux

On Arch Linux the script will add sources and install following packages:
* nodejs (lts)
* python-pip
* vim
* code
* zsh

## Zsh

The Zsh installation is based around the [Antigen](http://antigen.sharats.me) package manager.
Some notable packages will be installed:
* [Oh my Zsh repository config](https://github.com/robbyrussell/oh-my-zsh)
  for easy loading packages from OMZ repository
* [Git plugin](https://github.com/robbyrussell/oh-my-zsh/wiki/Plugin:git)
  for bunch of aliases (click the link to get the idea) and auto complete `git checkout <TAB>`
  for example
* [NVM plugin](https://github.com/lukechilds/zsh-nvm)
  for NVM in Zsh, but lso auto switches Node versions when .nvmrc is detected!
* [Autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
  for suggesting history entries (Fish shell-like behaviour)
* [Completions](https://github.com/zsh-users/zsh-completions)
  for shell TAB auto-completing for some command line tools (try `nvm <TAB>` for example)
* [Syntax Highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
  for Fish shell-like like syntax highlighting
* [Modified Zsh Pure theme](https://github.com/meister/pure)
  originally by [Sindre Sorhus](https://github.com/sindresorhus/pure)

## Ideas from these guys
* http://dotfiles.github.io/
* https://github.com/nicksp/dotfiles
* https://github.com/mathiasbynens/dotfiles

## Contributions

Feel free to make any suggestions under [issues](https://github.com/meister/dotfiles/issues/new?labels=enhancement)
or if you find an issue, [report it](https://github.com/meister/dotfiles/issues/new?labels=bug) or just make a pull request.

## License

MIT © [Martin Kapp](https://github.com/meister)
