
cdrepo
git clone --recursive https://github.com/Airblader/xcb-util-xrm.git
cd xcb-util-xrm/
./autogen.sh
make -j2
sudo make install

# cat > /etc/ld.so.conf.d/i3.conf 
# /usr/local/lib/

sudo ldconfig
sudo ldconfig -p

cdrepo
git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps
autoreconf --force --install
rm -Rf build/
mkdir build
cd build/
 ../configure --prefix=/usr --sysconfdir=/etc
 make
 sudo make install
