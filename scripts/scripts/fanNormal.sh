
if [ -L /etc/thinkfan.conf ]; then 
  sudo rm /etc/thinkfan.conf
fi

sudo ln -s /etc/thinkfan.normal /etc/thinkfan.conf
sudo systemctl restart thinkfan
