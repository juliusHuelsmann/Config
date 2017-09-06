sudo apt-get install vim git chromium-browser python-pip python3-pip pcmanfm ranger

sudo apt-get install htop
# i3
/usr/lib/apt/apt-helper download-file http://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2017.01.02_all.deb keyring.deb SHA256:4c3c6685b1181d83efe3a479c5ae38a2a44e23add55e16a328b8c8560bf05e5f
apt install ./keyring.deb
echo "deb http://debian.sur5r.net/i3/ $(grep '^DISTRIB_CODENAME=' /etc/lsb-release | cut -f2 -d=) universe" >> /etc/apt/sources.list.d/sur5r-i3.list
apt update
apt install i3


# qutebrowser
apt-get install python3-lxml python-tox python3-pyqt5 python3-pyqt5.qtwebkit python3-pyqt5.qtquick python3-sip python3-jinja2 python3-pygments python3-yaml
dpkg -i python3-pypeg2_*_all.deb
dpkg -i qutebrowser_*_all.deb

# oh my zsh
sudo apt-get install wget zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

