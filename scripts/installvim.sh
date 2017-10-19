#!/bin/bash

sudo pacman -S mercurial
cd /mnt/data/repos
hg clone ssh://hg@bitbucket.org/vim-mirror/vim

cd vim
sudo make uninstall


sudo make uninstall
make clean

make distclean
./configure \
  --with-features=huge \
  --enable-multibyte \
  --enable-rubyinterp=yes \
  --enable-fontset \
  --enable-largefile \
  --enable-pythoninterp=dynamic \
  --with-python-config-dir=/usr/lib/python2.7/config \
  --enable-python3interp=yes \
  --enable-python3interp
  --with-python3-config-dir=/usr/lib/python3.6/config-3.6m-x86_64-linux-gnu \
  --enable-perlinterp=yes \
  --enable-luainterp=yes \
  --enable-gui=gtk2 \
  --enable-cscope \
  --with-compiledby="me" \
  -clipboard \
  --enable-fail-if-missing
  #- clipboard 

make -j2 
sudo make install

# fo ubuntu
# sudo apt-get install gtk2-engines-pixbuf
