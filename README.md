# meister’s dotfiles

This repo contains mainly dotfiles for the terminal and editor setup. This setup is mostly intended
for development environments that use NodeJS and Git heavily. The Zsh theme and NVM setups main
goals are to bring visibility for the developers about the Node versions and Git statuses.

## Note: Current testing status
* [ ] macOS Sierra
* [x] ElementaryOS (Loki)
* [ ] Ubuntu 16.04

## Installation

To install this exact setup:
```
bash -c "`curl -fsSL https://raw.github.com/meister/dotfiles/master/install.sh`"
```

### Steps in general

Installation consists of installing few components:
* Base tools
* Installing terminal themes & fonts
* Installing and configuring [Zsh](http://zsh.sourceforge.net)
* Installing and configuring VIM

### Linux (Ubuntu based)

On Ubuntu the script will add sources and install following packages:
* git
* nodejs (6.x)
* python-pip
* vim
* code (VS Code)
* google-chrome-stable

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
* [Pure theme](https://github.com/meister/pure)
  by yours truly

## Ideas from these guys
* http://dotfiles.github.io/
* https://github.com/nicksp/dotfiles
* https://github.com/mathiasbynens/dotfiles