#!/usr/bin/env bash

# @TODO Fix VIM Config
return

# Update Vundle
if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
else
  (cd ~/.vim/bundle/Vundle.vim && git pull)
fi

# Back up previous config
[ -f ~/.vimrc ] && mv ~/.vimrc ~/.vimrc_backup
[ -L ~/.vimrc ] && rm ~/.vimrc

# Link config
ln -s "${BASEDIR}"/editors/vim/vimrc ~/.vimrc

# Install plugins
vim +PluginClean +qall
vim +PluginInstall +qall
