#!/usr/bin/env bash

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
ln -s $BASEDIR/vim/vimrc-meister ~/.vimrc

# Install plugins
vim +PluginInstall +qall