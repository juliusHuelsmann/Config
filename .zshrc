export XKB_DEFAULT_LAYOUT=de,us
export XKB_DEFAULT_OPTIONS=grp:alt_shift_toggle

# CHecks if already sourced ( I have to link the zshenv, and that is sourced after zshrc)
if [ "$SOURCED_ZSHRC" -eq 1 ]; then
  SOURCED_ZSHRC="2"

  ZSH_THEME="agnoster"
  plugins=(git git-extras github zsh-syntax-highlighting command-not-found)
  export ZSH=~/.oh-my-zsh
  source $ZSH/oh-my-zsh.sh


  # generated shortcut file
  source $HOME/.shortcuts

  # Sets the Mail Environemnt Variable 
  # (was done during the installation of procmail for using the mutt client)
  MAIL=/var/spool/mail/x && export MAIL

  # Path to your oh-my-zsh installation.
  export EDITOR='vim'
  export VISUAL='vim'
  export PATH=$PATH:~/.local/bin/:/mnt/data/local/programs/:~/scripts/scripts/
  export BEEP=/usr/share/sounds/ubuntu/ringtones/Harmonics.ogg
  export TERM=xterm
  export TERM=xterm-256color
  export PATH="$PATH:/home/juli/.gem/ruby/2.6.0/bin"
  export PATH="$PATH:/mnt/data/local/programs"
  export PATH=$PATH:/home/x/.gem/ruby/2.4.0/bin
  export PATH=$PATH:/usr/local/spark/bin
  export PATH=$PATH:/usr/local/gcc-10.0/bin/
  export PATH=$PATH:/snap/bin
  export SPARK_HOME=/usr/lib/python3.6/site-packages/pyspark
  export SSH_AUTH_SOCK=/run/user/$(id -u)/keyring/ssh


  # I cloned a repository which prints error output in a different format. 
  if [[ -a /mnt/data/online/repos/stderred/build/libstderred.so ]]; then
    bold=$(tput bold || tput md)
    red=$(tput setaf 202)
    export STDERRED_ESC_CODE=`echo -e "$bold$red"`
    export LD_PRELOAD="/mnt/data/online/repos/stderred/build/libstderred.so${LD_PRELOAD:+:$LD_PRELOAD}"
  fi


  function inds_license_manual() {
    old_pwd=$(pwd)
    command="./generate_license.sh $@"
    echo "executing $command"
    cd /mnt/data/online/repos/dataspree/ai/platform/license-gen && eval $command && echo $(pwd)/license.json
    cd $old_pwd
  }

  function inds_license() {
    old_pwd=$(pwd)
    command="./generate_license.sh $(clippaste)"
    echo "executing $command"
    cd /mnt/data/online/repos/dataspree/ai/platform/license-gen && eval $command && echo $(pwd)/license.json
    clipcopy "$(pwd)/license.json"
    cd $old_pwd
  }

  timezsh() {
    shell=${1-$SHELL}
    for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
  }


  function rmswp() {
    echo "Removing $(lsswp)"
    rm $(lsswp)
    echo "Remaining occurrences: $(lsswp)."
  }
  function li() {
    ls -t | head -n 1
  }
  function fo() { grep -irnw . -e $1 | grep -v build | grep -v tags | grep -v // | grep -v 'Binary file' | grep $1 }
  function foc() { grep -irnw . -e $1 | grep -v build | grep -v tags | grep -v 'Binary file' | grep $1 }
  function yvy() { k=$(pwd); cdmu; yv "$(clippaste)"; cd $k}
  function z() { result=$(ls -t *pdf | awk '{print "" $0}' |rofi -dmenu) 3> /dev/null && daemonize zathura "$result" }
  function o() { result=$(ls -t *pdf | awk '{print "" $0}' |rofi -dmenu) 3> /dev/null && daemonize okular "$result" }
  function xx() { daemonize $(ls $1 | awk '{print "xdg-open " $0}' | rofi -dmenu) 2> /dev/null }
  function compressPdf() { gs -sDEVICE=pdfwrite -dPDFSETTINGS=/ebook -q -o "$1.pdf" "$1"}
  function compress()    { gs -sDEVICE=pdfwrite -dPDFSETTINGS=/ebook -q -o "$2" "$1" }
  alias vlogin="tsh login --proxy=teleport.data-spree.com --user julius.huelmann; tsh ssh -N -L 6716:localhost:6716 -L 20023:localhost:20023 dataspree@vulpus"
  alias mergePdfs="qpdf --empty --pages *.pdf -- out.pdf"
  alias cpwd="pwd | clipcopy"
  alias cppwd="echo -e \\\"`pwd`\\\" | clipcopy"
  alias hcat=highlight --out-format=ansi
  alias day="killall redshift -1; xrandr --output eDP-1 --auto --brightness 2; redshift -O 25000"
  alias normal="killall redshift -1; xrandr --output HDMI-1 --brightness 1; xrandr --output HDMI-2 --brightness 1; xrandr --output eDP-1 --brightness 1"
  alias night0="dawn 25000"
  alias night1="dawn 2700"
  alias night2="dawn 2250"
  alias night3="dawn 2000"
  alias night4="dawn 1700"
  alias night5="dawn 1000"
  alias dawn="normal; redshift -O $1"
  # Ranger
  alias stranger="source ranger"
  alias strange=stranger
  alias str=stranger
  # git aliases 
  alias gil="gl"
  alias gip="gp"
  alias gic="gc"
  alias gid="git diff"
  alias gis="git status"
  alias gia="ga"

  alias memTop="ps axch -o cmd,%mem --sort=-%mem | head -n 10"
  alias cpuTop="ps axch -o cmd,%cpu --sort=-%cpu | head -n 10"
  alias cpuTemp="sensors | awk '/^temp1:/ {print $2}' | tail -n 1"

  # Youtube downloader
  alias yv="youtube-dl --add-metadata -ic"
  alias ya="youtube-dl --add-metadata -ixc"
  function yay() { k=$(pwd); cdmu; ya "$(clippaste)"; cd $k}
  function yayy() { ya "$(clippaste)"; }
  alias lsswp="find -name '*.swp'"

  # Use case: e.g. for_each 'ffmpeg -i "$i" "$i.mp4"'
  function for_each() { for i in *; do eval "$@"; done }

  alias updateKeysUbuntu="apt-key list | awk '/expired/{ print $2 }' | while read k; do apt-key adv --keyserver keys.gnupg.net --recv-keys ${k#*/}; done"
  alias updateKeysUbuntuDe="apt-key list | awk '/verfallen/{ print $2 }' | while read k; do apt-key adv --keyserver keys.gnupg.net --recv-keys ${k#*/}; done"


  # alias zshconfig="mate ~/.zshrc"
  # alias ohmyzsh="mate ~/.oh-my-zsh"
  alias sz="SOURCED_ZSHRC='0'; source ~/.zshrc"
  alias vz="vim ~/.zshrc"
  alias vi3="vim ~/.config/i3/config"
  alias vi3s="vim ~/.config/i3/config.standard"
  alias vi3l="vim ~/.config/i3/config.low"
  alias vr="vim ~/.config/ranger/rc.conf"
  alias vt="vim ~/.config/termite/config"

  alias beep='paplay $BEEP'
  alias updatePip="pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | sudo -H xargs -n1 pip install -U"
  alias scanHome="scanimage --device 'hpaio:/usb/OfficeJet_4650_series?serial=TH5AE2J0KV0662' --format=png --resolution 300"
  alias scanHomel="scanimage --device 'hpaio:/usb/OfficeJet_4650_series?serial=TH5AE2J0KV0662' --format=png --resolution 800"
  alias mirror="convert -rotate 180"
  alias mirrorAll="for f in *.png; do echo $f; convert -rotate 180 $f $f; done"
  alias workworkworkworkwork="systemd-inhibit --what=handle-lid-switch sleep 1d"

  alias l="ls -l"
  alias ll="ls -l"
  alias lt="ls -lth"
  alias x="exit"
  alias c="clear"
  alias cx="clear; exit"
  # Push
  alias uuu="pushu"
  alias u2d="pushur"
  alias ttt="pusht"
  alias nnn="pushn"
  alias uuv="pushuv"
  alias uuos="pushos"
  alias rrr="pushr"
  alias cdreading="cd /mnt/data/online/repos/Readings"
  alias lspdf="lsPdf"
  alias puh="git add .; git commit -am \"partial commit\"; git push;"

  # edit the file that was changed last (of all files, independent on the ending)
  alias vl='vim $(ls -t | head -n 1)'

  function quickVid() {
      ffmpeg -i "$1" -filter_complex "[0:v]setpts=0.9009009009009009*PTS[v];[0:a]atempo=1.11[a]" -map "[v]" -map "[a]" -c:v libx264 -c:a aac "$1Quick.mp4"

  }

  function startSshAgent() {
    ssh-add -l &>/dev/null
    if [ $? -ne 0 ]; then
      echo "i2"
      test -r ~/.ssh-agent && \
        eval "$(<~/.ssh-agent)" >/dev/null

      ssh-add -l &>/dev/null
      echo "check after"
      if [ $? -ne 2 ]; then
        (umask 066; ssh-agent > ~/.ssh-agent)
        eval "$(<~/.ssh-agent)" >/dev/null
        ssh-add
        echo "added!"
      else
        echo "ino"
      fi
    else 
        echo "ino00"

    fi
  }


  function isFlag() { [[ $1 =~ ^- ]] }
  function isNumber() { [[ $1 =~ ^[0-9]+$ ]] }

  function isValidIp() {
    [[ $1 =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]] #<actually does not check bounds (<255).
  }


  # record #1 : filename
  # XXX: record entire screen as default (without slop)
  function record() {
    read -r X Y W H G ID < <(slop -f "%x %y %w %h %g %i")
    ffmpeg -f x11grab -r 30 -s "$W"x"$H" -i :0.0+$X,$Y -c:v libx264 -q:v 1 $1
  }


  function mplayer() { command mplayer -af scaletempo $@ -framedrop -cache 8192}

  function ssh() {




    arg=$1

    position=1


    for f in "$@"; do
      position=$((position + 1))
      if isFlag $f; then; else 
        arg=$f #<$k
      fi
    done

    changed=false
    decomposition=("${(@s/@/)arg}") #<into uname and ip
    len=$#decomposition
    name=$decomposition[1]
    addr=$decomposition[-1]
    echo "0:$decomposition[0]; 1:$decomposition[1], 2:$decomposition[2]" 

    if (( len > 2 )); then; echo "error."; return; fi

    echo "addr=$addr"
    if isNumber $addr; then
      arg="192.168.178.$addr"
      changed=true
    else 
      echo "is not Number $addr"
    fi
    if (( len == 2 )); then 
      arg="$name@$arg"
    fi
    echo "arg=$arg"





    printf -v color "$(printf '%02x' $(echo $addr | cut -d '.' -f 2-  | tr '.' ' ' | xargs -n1 | while read -r line; do echo $((line%55)); done))"

    # only use the last 

    # range of 85 for each value
    k=$(echo $addr  | cut -d '.' -f 4-)
    ka=$(((k%6)*10))
    kb=$((((k/6)%6)*9))
    kc=$((10+(k/36)*10))
    echo $ka $kb $kc

    printf -v color "$(printf '%02x' $ka $kb $kc)"

    clear
    #printf '\033]11;#101A39\007'
    printf "\033]11;#$color\007"

    if $changed; then
    command ssh ${@:$position} ${@:$position:$#} $arg
    else 
    command ssh $@
    fi
    failed=$?
    if [ $failed -eq 0 ]; then
      clear 
    fi
    printf '\033]11;#000000\007'
  }

  function lsPdf() { ls -t | grep .pdf | lpdf  | more }

  function lpdf() {
      while read f; do
        d=$(echo $f | grep pdf)
        if [ ${#d} -gt 0 ]; then
          k=$(echo -e $(pdfinfo $f | grep Pages | grep Pages)| tr -d '[:space:]')
          if [ ${#k} -gt 0 ]; then
            k="$k "
            k=${k:6:-1}
            echo -e "$k\t$f" 
          fi
        fi
      done
  }


  function pushuv() {
    if [ -z "$1" ]; then
      notify-send "What is it I want to insert as requested utility!?" 
    else
    pushu "[VIM]" $*
    fi
  }
  function pushos() {
    if [ -z "$1" ]; then
      notify-send "What is it I want to insert as requested utility!?" 
    else
    pushu "[OS]" $*
    fi
  }

  function pusht() {
    if [ -z "$1" ]; then
      notify-send "Which task?" 
    else
      ret=$(pwd)
      k=" * [ ] $*" 
      notify-send "Pushed: '$k'" 
      cdreading
      echo -e $k >> tasks.mdpp
      git commit -am "semi-auto pushed task needed."
      git push
      cd $ret
    fi
  }

  function pushur() {
    if [ -z "$1" ]; then
      notify-send "what's so urgent?" 
    else
      ret=$(pwd)
      k=" * [ ] $*" 
      notify-send "Pushed: '$k'" 
      cdreading
      echo -e $k >> u2d.mdpp
      git commit -am "semi-auto pushed utility needed."
      git push
      cd $ret
    fi
  }

  function pushu() {
    if [ -z "$1" ]; then
      notify-send "What is it I want to insert as requested utility!?" 
    else
      ret=$(pwd)
      k=" * [ ] $*" 
      notify-send "Pushed: '$k'" 
      cdreading
      echo -e $k >> utilitiesNeeded.mdpp
      git commit -am "semi-auto pushed utility needed."
      git push
      cd $ret
    fi
  }

  function gcatasks() {
    k=$(catasks $*)
    notify-send "$k" 
  }

  function catasks() {
  k="$*"
  if [ -z "$*" ]; then
    k=5;
  fi
  cat /mnt/data/online/repos/online/Readings/tasks.mdpp | tail -n $k
  }

  function pushn() {
    if [ -z "$*" ]; then
      notify-send "Tell me what to note down sir!" 
    else
      ret=$(pwd)
      k=" - $*" 
      notify-send "Pushed: '$k'" 
      cdreading
      echo -e $k >> notes.mdpp
      git commit -am "semi-auto pushed reading."
      #eval $(ssh-agent)
      #ssh-add
      git push
      cd $ret
    fi
  }
  function pushr() {
    if [ -z "$*" ]; then
      notify-send "What is it I want to read!?" 
    else
      ret=$(pwd)
      k=" * [ ] $*" 
      notify-send "Pushed: '$k'" 
      cdreading
      echo -e $k >> readingQueue.mdpp
      git commit -am "semi-auto pushed reading."
      #eval $(ssh-agent)
      #ssh-add
      git push
      cd $ret
    fi
  }

  function notify-send() {
    command notify-send $@

    #( mplayer ~/.config/i3/beep.mp3 > /dev/null 2>&1 > /dev/null &) > /dev/null 
    #sleep 0.15
    #( mplayer ~/.config/i3/beep.mp3 > /dev/null 2>&1 > /dev/null &) > /dev/null
    #sleep 0.15
    ( mplayer ~/.config/i3/beep.mp3 > /dev/null 2>&1 &) > /dev/null

  }



  function diffdir() {

      currdir=$(pwd)
      cd $2; p2=$(pwd)
      cd $currdir; cd $1; p1=$(pwd)

      intermedRes=$(diff -r $p1 $p2 | grep $p1 | awk '{print $3, $4}')

      
      if echo $* | grep -e "--pipe" -q
      then
          cd $p1
          
          notExist=$(echo $intermedRes | grep ":" | sed -r 's/[: ]+/\//g' | grep "$p1/")
          differ=$(echo $intermedRes | grep -v ":" | sed 's/ .*//') 
          overall=$( echo "$notExist\n$differ" ) 
          echo $overall
          cd $currdir 
      
      else
      
          cd $currdir
          echo "Display differences in two directories recursively:\n"
          notExist=$(echo $intermedRes | grep ":" | sed -r 's/[: ]+/ \t|\t/g' | grep "$p1 ")
          differ=$(echo $intermedRes | grep -v ":")
      
          anotEx=$(echo $notExist | wc -l)
          adiffer=$(echo $differ | wc -l)
          resultMSG="Result:\tDiffer\t\t$adiffer\n\tnotExist\t$anotEx" 
          echo "$resultMSG\n"
              
          
          echo "1) The following files do only exist in one of the two"
          echo "directories:"
          echo "DIRECTORY\t|\tFILE"
          echo "----------------+--------------------------"
          echo $notExist
              
          echo "\n2) The following files differ:"
          echo $differ
      fi
      cd $currdir   
  }

  #
  alias ct="daemonize st 2> /dev/null"


  # Daemonize a command / sequence of commands
  function daemonize() { ("$@" &) & }


  #
  function getlastword() {
      h=$1;
      anz=`expr "$h" : '^.*\s'`
      if [ $anz -eq 0 ]; then; 
          echo "";
      else
          len=${#h}
          anz=$((anz-1))
      
          echo ${h:$anz:$len}
      fi
  }


  #
  #
  function connectAvailableMonitor() {
      ms=$(xrandr --listmonitors | grep -v "$(xrandr --listactivemonitors)") | grep -v "Monitors: "
      ms=$(getlastword $ms)
      # well in case there are more than one 
      echo "$ms"
      xrandr --output --right-of LVDS1
      feh --bg-scale ~/.i3/w.jpg
  }


  #
  function disconnectAdditionalMontiors() {
      ms=$(xrandr --listactivemonitors) | grep -v "Monitors: "
      ms=$(getlastword $ms)
      
      echo $ms
  }
  #
  # This is what has become a simple forwarding funciton
  # for using grep (because after I wrote the original function
  # I got aware of the possibility to use those simple grep
  # flags indicating the lines before and after)
  function grepx() {
      search=$1;
      before=$(($2+0));
      after=$(($3+0));
      
      filename="$4"
      if [ $filename ]
      then
          grep -A$after -B$before -P "$search" $filename;
      else
          # consider piped output
          grep -A$after -B$before -P "$search";
      fi
  }

  function copyFromSmartphone(){
    
    ip="192.168.178.$1:2121";
    mountDir=$2;
    backupDir=$3;
    
    # Go for default dirs if parameters are not set.
    if [ -z ${mountDir} ] 
    then
      mountDir="/mnt/smartphone"
    fi
    
    if [ -z ${backupDir} ]
    then
      backupDir="/mnt/data/backupSmartphone";
    fi
    
    #
    # referrs to the diffdir function located inside this repository
    echo "The following directories have been entered: $ip $mountDir $backupDir"
    printf "If you want to continue, press 'y': "
    read continePrompt
    
    if [ "$continePrompt" = "y" ]; then
      echo "okay, I'll continue processing!\n\n";
      echo "mounting ftp server:"
      curlftpfs $ip $mountDir -o disable_eprt
      
      echo "copying files. This will take its time:"
      # cp -r $mountDir $backupDir
      # rsync -a -v $mountDir $backupDir
      cd $mountDir
      ls $mountDir | parallel -v -j32 rsync -raz --progress {} $backupDir/{}


      wait

      
      echo "making diff of directories"
      diffdir $mountDir $backupDir
    else
      echo "Bye!";
    fi
    
  }




  function searchInputDevice() {
  ids=$(xinput --list | awk -v search="$1" \
      '$0 ~ search {match($0, /id=[0-9]+/);\
                    if (RSTART) \
                      print substr($0, RSTART+3, RLENGTH-3)\
                  }'\
      )
  echo $ids;
  }

  #
  #  Disables devices on startup 
  #
  function disableUnwantedDevicesOnStartup() {

    idTouchpad=$(searchInputDevice "TouchPad")
    idScreen=$(searchInputDevice "Finger")
    idOSXTouchpad=$(searchInputDevice "bcm5974")
    if [ "$idTouchpad" -ne "" ]; then 
      echo "Info: device 'THINK touch' with id $idTouchpad disabled."
      xinput disable $idTouchpad
    fi
    if [ "$idScreen" -ne "" ]; then 
      echo "Info: device 'THINK screen' with id $idScreen disabled."
      xinput disable $idScreen
    fi
    if [ "$idOSXTouchpad" -ne "" ]; then 
      echo "Info: device 'OSX touch' with id $idOSXTouchpad disabled."
      xinput disable $idOSXTouchpad
    fi

    xdotool mousemove 10000 10000
  }



  function genHash() { echo -n $1 | iconv -t utf16le | openssl md4 }


  #
  # Very ugly script yielding the overall battery status!
  #
  function getBatteryStatus() {
    cap=0
    cnt=0
    stat=""

    txt=$(acpi -b)

    local IFS=$'\n'
    if [ $ZSH_VERSION ]; then
        setopt sh_word_split
      fi
    for p in $txt; do
      local IFS=$' '
      s=$(echo -e $p | awk -F'[,:%]' '{print $2, $3}') 
      c=0
      for i in $s; do
        if [ $c -eq 0 ]; then
          if [ $i = Discharging ]; then
            stat=$i
          fi
        else 
          cap=$((cap+i))
          cnt=$((cnt+1))
        fi
        c=$((c+1))
      done
      local IFS=$'\n'
    done
    if [ $cnt -eq 0 ]; then
      echo -e "0 NoBatteryFound!"
    else
      echo -e "$((cap/cnt)) $stat"
    fi
  }

  function printBatteryStatusToCli() {

    IFS=$' '
    getBatteryStatus | {
      read -r capacity state 
    echo "The current overall battery capacity is $capacity ($state)."
    }
  }














  ##############################################################################
  #                                    zle                                     #
  ##############################################################################
  #
  # Vim mode in command line
  #
  #bindkey -v          #< enable vim mode instead of EMACS
  #bindkey -e          #< somehow EMACS leads to more intelligent autocmpl
  #bindkey -s jk \\e   #< bind jk to be the escape sequence from insert mode. 
  #export KEYTIMEOUT=4 #< used for setting delay to .4 sec (just right for jk)
  # XXX: show 
  #     1) pwd (only the last 3 dirs) / ~ if in current user home
  #     2) indicate how the last command exited
  #     3) colored git status
  #
  # zle widgets
  #
  # if in a git repo, show dirty indicator + git branch

  # show git branch/tag, or name-rev if on detached head
  #parse_git_branch() {
  #  (command git symbolic-ref -q HEAD || command git name-rev --name-only --no-undefined --always HEAD) 2>/dev/null
  #}

  alias screenkey="cd /mnt/data/online/repos/screenkey; python2 main.py"
  alias lock="i3lock -i /home/x/.config/i3/lock.png"
  alias fix_cuda="sudo rmmod nvidia_uvm; sudo modprobe nvidia_uvm"

  shd() { curl -O $(curl -s http://sci-hub.tw/"$@" | grep location.href | grep -o http.*pdf) ;}

  #export PATH=/mnt/data/local/programs/:/home/x/scripts/:/home/x/scripts/scripts/:/usr/local/cuda-11.7/bin${PATH:+:${PATH}}
  #export LD_LIBRARY_PATH=/usr/local/cuda-11.7/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
  #
  #source /home/x/ADLINK/EdgeSDK/1.8.2/config_env_variables.com >> /dev/null
  #export NVM_DIR="$HOME/.nvm"
  #[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  #[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
  #


else
  SOURCED_ZSHRC="1"
fi



