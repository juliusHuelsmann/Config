
# Content

This repository contains 
  - [configuration](configs) files of programs I use on my copy of arch linux and scripts that allow me to set up a new installation of ach with my configuration. My configuration of the following programs are stored inside this repository:
    1. oh-my-zsh
    2. vim
    3. qutebrowser
    4. mutt
    5. bashrc (zshrc)
    6. i3


# List of own commands provided in zshrc
- `lsPdf` list the amount of pages of all pdfs in the current directory, sorted by timestemp 
- `ls | lpdf | sort -V` list all pdfs (curr dir) by sizes (decr)
- `sz` source zshrc
- `vz` edit zshrc
- `ct` copy terminal. Does also copy the ssh agent and the current directory.
- `upw` after providing ssh key password once, the currnet terminal and all
  terminals opend via `ct` can access the ssh key without the necessity to
  re-enter the ssh key.
- `addSshAgent` like `upw`, difference: addSshAgent checks whether the ssh
  agent has already been added (indifferent on whether successful or unsuccessful) 
- `ttt` and other scripts are commands for pushing taks to my task tracker and
  readings repo. hardcoded path.
- `catasks` cats the first n current tasks to the dunst. 
- `diffdir dir1 dir2` prints list of diffs of directories.
- `daemonize` start following process as daemon. Similar to `nohup > /dev/null
  ` in one simple command.


- `getlastword` get last word of input
- `grepx before after` wrapper for grep for specifying region around search hit
  to be displayed

# Manual todos
sudo systemctl disable cups-browsed.service

#### Crontab
```bash
sudo pacman -S cron
crontab -e
#replace USERNAME by actual username
PATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/mnt/data/repos/programs/gcc-linaro-7.1.1-2017.08-i686_arm-linux-gnueabihf/bin/:/home/USERNAME/.gem/ruby/2.4.0/bin:/usr/local/spark/bin:/mnt/data/repos/programs/gcc-linaro-7.1.1-2017.08-i686_arm-linux-gnueabihf/bin/:/home/USERNAME/.gem/ruby/2.4.0/bin:/usr/local/spark/bin:/mnt/data/repos/programs/gcc-linaro-7.1.1-2017.08-i686_arm-linux-gnueabihf/bin/:/home/USERNAME/.gem/ruby/2.4.0/bin:/usr/local/spark/bin 
*/2 * * * * /mnt/data/scripts/batteryWarning 2>&1 ~/crerr.lg
*/1 * * * * /mnt/data/scripts/memoryWarning 

```

#### Ranger
For enabling the preview, exeucte the following command once:
```
ranger --copy-config=scope
```
#### SSH
- ubuntu:  apt install openssh-server
- vim /etc/ssh/ssdh_config
```
PermitRootLogin no
PubkeyAuthentication yes
AuthorizedKeysFile	.ssh/authorized_keys
PasswordAuthentication no
(AuthenticationMethods publickey)
UsePAM no
X11Forwarding yes
X11UseLocalhost no
# x = username placeholder
AllowUsers x 
```

#### Startup behavior
1. As I do not always require a gui, need a terminal open if the gui does not
   work (e.g. xkeyboard error) I disabled auto-launching the gui on startup in
   grub:
```bash
vim /etc/default/grub
GRUB_CMDLINE_LINUX_DEFAULT="text"#< used to be "quiet splash"
sudo update-grub
```
For my `systemd` machines:
```
sudo systemctl enable multi-user.target --force
sudo systemctl set-default multi-user.target
```

2. I put `eval $(ssh-agent); ssh-add` on top of the startx script for
automatically adding ssh agent on startup (shared by all applications started
by x).




`exec xcompmgr -c -f -n`
## Notes on stuff being likely to be usable in the future:

notify-send "string" # for sending information (e.g. on git updates, battery power)

## Finding out class of application
- for e.g.  window binding to workspace, For assign [class=..] $workspace10

1.  open application, 
2. open xprop via terminal, 
3. click on the app, class = 2nd vlaue



## Useful Commands / Installations

### Record gif for github
byzanz-record -d [DURATION] outputFile.gif
### Display gif
sxiv -a [FILENAME]
but does not offer the possibility to scroll fw and bw and pause

### Font cousine
sudo pacman -S ttf-croscore


### Remapping Left/ Right key to Caps + HJKL
- `xev` for finding out that caps = 66
- xmodmap ~/.Xmodmap
```
clear Lock
keycode 66 = ISO_Level3_Shift
```
- sudo vim `/usr/share/X11/xkb/symbols/de`
```
stuff
```


### Commands
```bash
# jupyter-notebook diffs
nbdiff-web [ref [ref]]
nbdiff-web file1 file2

# pip update all installed packages via pip
sudo pythonX upgradepip.py


```


### Installation

#### Pip packages
```

# Jupyter-notebook diff tool
nbdime

# python package that is used to automatically calculate a huge number of time series characteristics
tsfresh

# packages used since always
numpy, scipy, pandas, 
```


#### Jupyter-notebook diff python tool

```bash
pip install nbdime

# do manual diffing
nbdiff notebook_1.ipynb notebook_2.ipynb
nbdiff-web notebook_1.ipynb notebook_2.ipynb

# integrate into git diff and merge
nbdime config-git --enable --global

# (after integration): web diff between references of jupyternotebook.
nbdiff-web [ref [ref]]
nbdiff-web file1 file2
# Merge conflict could not be resolved? Browse differences in web tool
nbdime mergetool





```

## 
gem install json github
gh issues open --after=2009-09-14





## Vim
- ctags -R
- <Ctrl> ] goes to the definition :)


## Remap keys

### Old proceeding:
/usr/share/X11/xkb/symbols/ #< change keyboard
```bash
    // the following lines contain altered stuff
    key <AC06> {	[	  h,	H,	Left,	Left ]	};
    key <AC07> {	[	  j,	J,	Down,	Down ]	};
    key <AC08> {	[	  k,	K,	Up,	Up ]	};
    key <AC09> {	[	  l,	L,	Right,	Right ]	};
```
and insert the following into the Xmodmap
change .Xmodmap in home dir
```bash
.Xmodmap
clear Lock
keycode 66 = ISO_Level3_Shift
```

execute xmodmap .Xmodmap each time on login.


new proceeding:
just be sure to execute xmodmap .Xmodmap, and pull the xmodmap from repo :)


# change the refresh rate via xrandr
`xrandr -s 1280x1024 -r 645`



# remove cache
```bash
#Remove the uninstalled package files:
sudo paccache -ruk0
# Only keep newest 3 versions per pkg 
sudo paccache -r
```



# backlight
it is in most cases sufficient to add the user to the video group in order to change the backlight
settings. 
```
sudo pacman -S acpilight
sudo usermod -a -G video $(whoami)
# then find out which device is to be used (for keyboard) and replace the deivce.
```

At my macbook xbacklight could not detect any controllable devices, so I changed to acpi backlight
which is backwards compatible with xbacklight and works fine for screen and keyboard backlight. 

sudo pacman -S acpilight
 
not available via ubunutu, clone and install repository







#nmcli 
nmcli c 
show  #< show stored connections
up  CONNECTION
add  type [TYPE] ssid [essid] ifname [interface name] con-name [essid]

nmcli d 
 > wifi  
   > list #< list all currently observed connections

nmcli d status #< list interfaces, types and status 















LD_PRELOAD=/usr/lib/libasan.so ./predictor

