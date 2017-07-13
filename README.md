# meister’s dotfiles

This repo contains mainly dotfiles for the terminal and editor setup. This setup is mostly intended
for development environments that use NodeJS and Git heavily. The Zsh theme and NVM setups main
goals are to bring visibility for the developers about the Node versions and Git statuses.

## Note: Current testing status
* [ ] macOS Sierra
* [x] ElementaryOS (Loki)
* [ ] Ubuntu 16.04
* [x] Arch Linux (Antergos with Gnome desktop)

## Todo
* [ ] Include [Snazzyfied theme](https://github.com/meister/vim-snazzyfied) for VIM
* [ ] Include [Snazzyfied theme](https://github.com/meister/vscode-snazzyfied) for VS Code
* [x] Update .vimrc to include [Vundle](https://github.com/VundleVim/Vundle.vim) and some of the
  subjectively necessary plugins
* [ ] Make install components configurable

## Installation

To install this everything:
```
curl -fsSL https://raw.githubusercontent.com/meister/dotfiles/master/install.sh | bash -s -- --all
```

### Install options

| Arguments           | Description  |
|---|---|
| `--system`          | Install system tools and fonts |
| `--fonts`           | Install fonts |
| `--vim`             | Configure VIM |
| `--vscode`          | Configure VS Code |
| `--install-zsh`     | Install and configure ZSH |
| `--zsh`             | Configure ZSH (does not perform install) |

### Steps in general

Installation consists of installing few components:
* Base tools
* Installing terminal themes & fonts
  * Currently supported: pantheon (default with ElementaryOS) and gnome-terminal
* Installing and configuring [Zsh](http://zsh.sourceforge.net)
* Installing and configuring VIM

### Ubuntu based Linux

On Ubuntu the script will add sources and install following packages:
* git
* nodejs (6.x)
* python-pip
* vim
* code (VS Code)
* google-chrome-stable

### Arch Linux

On Arch Linux the script will add sources and install following packages:
* nodejs (edge)
* python-pip
* vim
* code (VS Code from AUR)
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

## License

MIT © [Martin Kapp](https://github.com/meister)
