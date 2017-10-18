sudo pacman -S mercurial
cd /mnt/data/repos
hg clone ssh://hg@bitbucket.org/vim-mirror/vim

cd vim
sudo make uninstall

cd src
make clean
./configure --with-features=huge \
 	    - clipboard \
 	    -clipboard \
            --enable-multibyte \
            --enable-rubyinterp=yes \
            --enable-pythoninterp=yes \
            --with-python-config-dir=/usr/lib/python2.7/config \
            --enable-python3interp=yes \
            --with-python3-config-dir=/usr/lib/python3.5/config \
            --enable-perlinterp=yes \
            --enable-luainterp=yes \
            --enable-gui=gtk2 \
            --enable-cscope
sudo make uninstall
make -j2 
sudo make install

# fo ubuntu
# sudo apt-get install gtk2-engines-pixbuf
