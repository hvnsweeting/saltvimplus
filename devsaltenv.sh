#!/bin/sh
# Script help create a virtualenv for running newest version of Salt
#TODO install all dependencies
#for now, just install newest salt from ppa then ``apt-get purge -y salt-*``

#if [ $EUID -ne 0 ]; then
#    echo "This script must run by root"
#fi
dest_dir=saltdev
if [ -e $dest_dir ]; then
    echo `pwd`/"$dest_dir is already existed, remove it"
    exit 1
fi

if [ `which virtualenv2` ]; then
    venv_cmd=virtualenv2
else
    venv_cmd=virtualenv
fi

code_only=$2
$venv_cmd --system-site-packages $dest_dir
. $dest_dir/bin/activate

cd $dest_dir

if [ -z $code_only ]; then
    wget https://github.com/saltstack/salt/archive/develop.tar.gz
    tar xzf develop.tar.gz
    pip install -e salt-develop
else
    git clone git://github.com/saltstack/salt.git mainstream
    pip install -e mainstream
fi
