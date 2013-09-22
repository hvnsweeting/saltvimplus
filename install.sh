#!/bin/bash

#apt-get install -y vim git

tempdir=$(mktemp -d)
cd $tempdir
git clone git://github.com/saltstack/salt-vim.git
git clone git://github.com/hvnsweeting/snipmate.vim.git
if [ ! -d ~/.vim ]; then
  mkdir ~/.vim
fi
cp -r salt-vim/* ~/.vim
cp -r snipmate.vim/* ~/.vim
wget https://raw.github.com/hvnsweeting/hvnrc/master/vimrc
cp vimrc ~/.vimrc
rm -rf $tempdir
