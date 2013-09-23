#!/bin/bash

echo "This install script requires: vim git wget"
#apt-get install -y vim git

tempdir=$(mktemp -d)
cd $tempdir
git clone git://github.com/saltstack/salt-vim.git
git clone git://github.com/hvnsweeting/snipmate.vim.git
git clone git://github.com/Townk/vim-autoclose.git

if [ ! -d ~/.vim ]; then
    mkdir ~/.vim
else
    cp -r ~/.vim /tmp/dotvim_`date +%Y%m%d_%H%M%S`
fi

for dir in *; do
    cp -r $dir/* ~/.vim
done

wget https://raw.github.com/hvnsweeting/hvnrc/master/vimrc
cp vimrc ~/.vimrc
rm -rf $tempdir
