
# Content

This repository contains 
  - [configuration](configs) files of programs I use on my copy of arch linux and scripts that allow me to set up a new installation of ach with my configuration. My configuration of the following programs are stored inside this repository:
    1. oh-my-zsh
    2. vim
    3. qutebrowser
    4. mutt
    5. bashrc (zshrc)
    6. i3


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



## Vim
- ctags -R
- <Ctrl> ] goes to the definition :)
