#!/bin/bash

echo "This install script requires: vim git wget"
#apt-get install -y vim git

tempdir=$(mktemp -d)
cd $tempdir
git clone git://github.com/saltstack/salt-vim.git
git clone git://github.com/hvnsweeting/snipmate.vim.git

if [ -d ~/.vim ]; then
    backup_dir=/tmp/dotvim_`date +%Y%m%d_%H%M%S`
    echo "BACKUP old ~/.vim to $backup_dir"
    mv ~/.vim $backup_dir
fi

mkdir ~/.vim

for dir in *; do
    cp -r $dir/* ~/.vim
done

wget -O ~/.vimrc https://raw.github.com/hvnsweeting/hvnrc/master/vimrc
rm -rf $tempdir
