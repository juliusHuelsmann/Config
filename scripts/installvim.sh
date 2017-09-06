pacman -S hg
hg clone https/::vim.googlecode.com/hg/ vim
cd /vim/src
./configure --enable-pythoninterp --with-features=huge --prefix=$HOME/opt/vim - clipboard
make && make install
mkdir -p $HOME/bin
cd $HOME/bin
lin -s $HOME/opt/vim/bin/vim
which vim
vim --version

# fo ubuntu
# sudo apt-get install gtk2-engines-pixbuf
