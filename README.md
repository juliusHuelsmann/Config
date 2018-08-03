
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
#### Ranger
For enabling the preview, exeucte the following command once:
```
ranger --copy-config=scope
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
