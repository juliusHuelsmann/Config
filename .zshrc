# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
#


# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh
export PATH=$PATH:~/.local/bin/:/mnt/data/local/programs/:~/scripts/scripts/
export BEEP=/usr/share/sounds/ubuntu/ringtones/Harmonics.ogg
if [[ -a /mnt/data/online/repos/stderred/build/libstderred.so ]]; then
  bold=$(tput bold || tput md)
  red=$(tput setaf 202)
  export STDERRED_ESC_CODE=`echo -e "$bold$red"`
  export LD_PRELOAD="/mnt/data/online/repos/stderred/build/libstderred.so${LD_PRELOAD:+:$LD_PRELOAD}"
fi

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="gnzh"
ZSH_THEME="agnoster"
# ZSH_THEME="kardan"
# standard used to be robbyrussell

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git git-extras github)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#

alias ka="killall"
alias stranger="source ranger"
alias strange=stranger
alias str=stranger
alias gil="gl"
alias gip="gp"
alias gic="gc"
alias gid="git diff"
alias gis="git status"
alias gia="ga"

alias updateKeysUbuntu="apt-key list | awk '/expired/{ print $2 }' | while read k; do apt-key adv --keyserver keys.gnupg.net --recv-keys ${k#*/}; done"
alias updateKeysUbuntuDe="apt-key list | awk '/verfallen/{ print $2 }' | while read k; do apt-key adv --keyserver keys.gnupg.net --recv-keys ${k#*/}; done"
#
#
#
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias sz="source ~/.zshrc"
alias vz="vim ~/.zshrc"
alias vi3="vim ~/.config/i3/config"
alias vi3s="vim ~/.config/i3/config.standard"
alias vi3l="vim ~/.config/i3/config.low"
alias vr="vim ~/.config/ranger/rc.conf"
alias vt="vim ~/.config/termite/config"

alias beep='paplay $BEEP'
alias cute="qutebrowser"
alias qute="qutebrowser"
alias qutie="qutebrowser"
alias updatePip="pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | sudo -H xargs -n1 pip install -U"
alias bri="sudo chown $(whoami) /sys/class/backlight/intel_backlight/brightness"
alias scanHome="scanimage --device 'hpaio:/usb/OfficeJet_4650_series?serial=TH5AE2J0KV0662' --format=png --resolution 300"
alias scanHomel="scanimage --device 'hpaio:/usb/OfficeJet_4650_series?serial=TH5AE2J0KV0662' --format=png --resolution 800"
alias mirror="convert -rotate 180"
alias mirrorAll="for f in *.png; do echo $f; convert -rotate 180 $f $f; done"
alias workworkworkworkwork="systemd-inhibit --what=handle-lid-switch sleep 1d"

pData="/mnt/data"
pInter="$pData/inter"
pOnline="$pData/online"
pLocal="$pData/local"
pScripts="$pData/scripts"
pRepos="$pOnline/repos"
pPrograms="$pLocal/programs"

alias cdd="cd $pData"

alias cdi="cd $pInter"
alias cdl="cd $pLocal"
alias cdp="cd $pPrograms"
alias cdprog=cdp
alias cdpro=cdp
alias cdorga="cd $pInter/orga"
alias cdorg=cdorga
alias cdmat="cd $pInter/material"
alias cdfree="cd $pInter/freeTime"
alias cdfre=cdfree



alias cds="cd $pScripts"

alias cdr="cd $pRepos"
alias cdrep="cdr; addSshAgent"

# Special repositories
alias cdm="cd $pRepos/NotesDL/"
alias cdsense="cd $pRepos/dima/SenseNative";
alias dsense="cdsense;vim";
alias cdp3="cd $pRepos/dima/p3";
alias cdp2="cd $pRepos/dima/p3";
alias cdp1="cd $pRepos/dima/p3";

alias seta="feh --bg-scale ~/.config/i3/image.jpg"
alias setb="feh --bg-scale ~/.config/i3/imageB.jpg"
alias setc="feh --bg-scale ~/.config/i3/imageC.jpg"
alias setd="feh --bg-scale ~/.config/i3/imageD.jpg"



alias lt="ls -lth"
alias x="exit"
alias c="clear"
alias cx="clear; exit"
alias uuu="pushu"
alias u2d="pushur"
alias ttt="pusht"
alias nnn="pushn"
alias uuv="pushuv"
alias uuos="pushos"
alias rrr="pushr"
alias cdreading="cd /mnt/data/online/repos/Readings"
alias lspdf="lsPdf"
alias upw="eval $(ssh-agent); ssh-add"
#alias push="ssh-add; git push"
#alias pull="ssh-add; git pull"
alias puh="git add .; git commit -am \"partial commit\"; git push;"

# local 
localarcht=juli@192.168.178.67
localubux=x@192.168.178.32
localubud=juli@192.168.178.48
localosx=x@192.168.178.20

#mac
localMu=x@192.168.178.20    #< mac  ubuntu
#dell
localDu=juli@192.168.178.48 #< dell ubuntu
#x
localXa=x@192.168.178.32    #< x230 manjaro
localXu=x@192.168.178.68    #< x230 ubuntu
#t
localTa=juli@192.168.178.67 #< t    arch

#
#mac
alias sshMu='ssh -X $localMu'
alias sshM=sshMu
alias sshm=sshM
#dell
alias sshDu='ssh -X $localDu'
alias sshD=sshDu
alias sshd=sshD
#x
alias sshXa='ssh -X $localXa'
alias sshXu='ssh -X $localXu'
#t
alias sshTa='ssh -X $localTa'
alias sshT=sshTa
alias ssht=sshT

function isFlag() {
  [[ $1 =~ ^- ]]
}

function isValidIp() {
  [[ $1 =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]] #<actually does not check bounds (<255).
}
function isNumber() {
  #[[ $1 =~ ^[0-9] ]]
  [[ $1 =~ ^[0-9]+$ ]]
}


function nosudo() {
  echo -n "[sudo] password for $(whoami):" 
  read -s password
  echo ""
  echo "I got the password $password"
  echo "$password" | command sudo -S $@ #2> /dev/null
  #XXX: only disadvantage: if the passwod is entered wrong, 
  #     it sipmly prompts again, but does not accept any input.
  #
}

# record #1 : filename
# XXX: record entire screen as default (without slop)
function record() {
  read -r X Y W H G ID < <(slop -f "%x %y %w %h %g %i")
  ffmpeg -f x11grab -r 30 -s "$W"x"$H" -i :0.0+$X,$Y -c:v libx264 -q:v 1 $1
}


function mplayer() {

  echo "evoke  command mplayer if you do not want scale tempo..."
  command mplayer -af scaletempo $@

}

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





  #B=$(echo $A | cut -d ' ' -f 5-)

  # entire command (___.???.???.???) is directly translated to color
  #printf -v color "$(printf '%02x' $(echo $addr  | cut -d '.' -f 2-  | tr '.' ' '))"
  # entire command (___.???.???.???) is translated to color, leaving out some
  # colors for keeping the value (hsv) low.
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
#
#mac
function scp2M() {
  scp -r $1 $localMu:$2
}
function scpM() {
  scp -r $localMu:$1 $2
}
#dell
function scp2Du() {
  scp -r $1 $localDu:$2
}
function scp2D() {
  scp -r $1 $localDu:$2
}
function scpD() {
  scp -r $localDu:$1 $2
}
#x
function scp2Xu() {
  scp -r $1 $localXu:$2
}
function scp2Xa() {
  scp -r $1 $localXa:$2
}
function scpX() {
  scp -r $localXa:$1 $2
}
#t
function scp2T() {
  scp -r $1 $localTa:$2
}
function scpT() {
  scp -r $localTa:$1 $2
}




function lsPdf() {
  ls -t | grep .pdf | lpdf  | more
}

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
  # push reading
 
  if [ -z "$1" ]; then
    notify-send "Which task?" 
  else
    ret=$(pwd)
    k=" * [ ] $*" 
    notify-send "Pushed: '$k'" 
    cdreading
    echo -e $k >> tasks.mdpp
    git commit -am "semi-auto pushed task needed."
    eval $(ssh-agent)
    ssh-add
    git push
    cd $ret
  fi
}
function pushur() {
  # push reading
 
  if [ -z "$1" ]; then
    notify-send "what's so urgent?" 
  else
    ret=$(pwd)
    k=" * [ ] $*" 
    notify-send "Pushed: '$k'" 
    cdreading
    echo -e $k >> u2d.mdpp
    git commit -am "semi-auto pushed utility needed."
    eval $(ssh-agent)
    ssh-add
    git push
    cd $ret
  fi
}
function pushu() {
  # push reading
 
  if [ -z "$1" ]; then
    notify-send "What is it I want to insert as requested utility!?" 
  else
    ret=$(pwd)
    k=" * [ ] $*" 
    notify-send "Pushed: '$k'" 
    cdreading
    echo -e $k >> utilitiesNeeded.mdpp
    git commit -am "semi-auto pushed utility needed."
    eval $(ssh-agent)
    ssh-add
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
  # push notes 
 
  if [ -z "$*" ]; then
    notify-send "Tell me what to note down sir!" 
  else
    ret=$(pwd)
    k=" - $*" 
    notify-send "Pushed: '$k'" 
    cdreading
    echo -e $k >> notes.mdpp
    git commit -am "semi-auto pushed reading."
    eval $(ssh-agent)
    ssh-add
    git push
    cd $ret
  fi
}
function pushr() {
  # push reading
 
  if [ -z "$*" ]; then
    notify-send "What is it I want to read!?" 
  else
    ret=$(pwd)
    k=" * [ ] $*" 
    notify-send "Pushed: '$k'" 
    cdreading
    echo -e $k >> readingQueue.mdpp
    git commit -am "semi-auto pushed reading."
    eval $(ssh-agent)
    ssh-add
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

function bright() {

  let brightness=500
  echo "echo $brightness > /sys/class/backlight/intel_backlight/brightness" | sudo zsh
}
function rbright() {
  brightness=$(cat /sys/class/backlight/intel_backlight/brightness)
  let brightness=$brightness-500
  if (($brightness < 1)); then
    let brightness=1
  fi
  echo "echo $brightness > /sys/class/backlight/intel_backlight/brightness" | sudo zsh
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
# Daemonize a command / sequence of commands
function ct() {
    k=$(pwd)
    (termite $k &) &
 
}


#
# Daemonize a command / sequence of commands
function daemonize() {
    #("$*" &) &
    ("$@" &) &
}


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

function addSshAgent() {

  if [ $SSH_AGENT_PID ]
  then
    echo "already added";
  else
    eval $(ssh-agent);
    ssh-add
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

function sentryUpgrade() {
  export SENTRY_SECRET_KEY="phz2reaw4sj@m6a*9bwd!h0cv(0&tl53%5*5vqmn6@o7m3rgjx"
  export SENTRY_SECRET_KEY="vu1&uu*^q*a5*%76&85zg772vv8^%ci53!5&#8)^b_!=(1625%"
  sudo docker run \
    --link sentry-redis:redis \
    --link sentry-postgres:postgres \
    --link sentry-smtp:smtp \
    --env SENTRY_SECRET_KEY=$SENTRY_SECRET_KEY \
    --rm -it sentry-onpremise upgrade
}

function sentryDeployRun() {
  export SENTRY_SECRET_KEY="phz2reaw4sj@m6a*9bwd!h0cv(0&tl53%5*5vqmn6@o7m3rgjx"
  export SENTRY_SECRET_KEY="9m!vvhl-!g-3&__uiksagt!ncwu)__2enb!f*z^*mjro6rmngx"

  # run web client
  sudo docker run \
    --link sentry-redis:redis \
    --link sentry-postgres:postgres \
    --link sentry-smtp:smtp \
    --env SENTRY_SECRET_KEY=$SENTRY_SECRET_KEY \
    --detach \
    --name sentry-web-01 \
    --publish 9000:9000 \
    sentry-onpremise \
    run web

  # run worker
  sudo docker run \
    --link sentry-redis:redis \
    --link sentry-postgres:postgres \
    --link sentry-smtp:smtp \
    --env SENTRY_SECRET_KEY=$SENTRY_SECRET_KEY \
    --detach \
    --name sentry-worker-01 \
    sentry-onpremise \
    run worker

  sudo docker run \
    --link sentry-redis:redis \
    --link sentry-postgres:postgres \
    --link sentry-smtp:smtp \
    --env SENTRY_SECRET_KEY=$SENTRY_SECRET_KEY \
    --detach \
    --name sentry-cron \
    sentry-onpremise \
    run cron

}

function sentryRun() {

  sudo docker start sentry-postgres sentry-redis sentry-smtp
  sudo docker start sentry-worker-01 sentry-cron sentry-web-01
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



function genHash() {
  echo -n $1 | iconv -t utf16le | openssl md4
}


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


# Sets the Mail Environemnt Variable 
# (was done during the installation of procmail for using the mutt client)
MAIL=/var/spool/mail/x && export MAIL

export PATH=$PATH:/mnt/data/online/repos/programs/gcc-linaro-7.1.1-2017.08-i686_arm-linux-gnueabihf/bin/
export PATH=$PATH:/home/x/.gem/ruby/2.4.0/bin
export PATH=$PATH:/usr/local/spark/bin

export SPARK_HOME=/usr/lib/python3.6/site-packages/pyspark













##############################################################################
#                                    zle                                     #
##############################################################################
#
# Vim mode in command line
#
bindkey -v          #< enable vim mode instead of EMACS
bindkey -e          #< somehow EMACS leads to more intelligent autocmpl
bindkey -s jk \\e   #< bind jk to be the escape sequence from insert mode. 
export KEYTIMEOUT=4 #< used for setting delay to .4 sec (just right for jk)
# XXX: show 
#     1) pwd (only the last 3 dirs) / ~ if in current user home
#     2) indicate how the last command exited
#     3) colored git status
#
# zle widgets
#
# if in a git repo, show dirty indicator + git branch

# show git branch/tag, or name-rev if on detached head
parse_git_branch() {
  (command git symbolic-ref -q HEAD || command git name-rev --name-only --no-undefined --always HEAD) 2>/dev/null
}

# git_custom_status() {
#  local git_where="$(parse_git_branch)"
#  [ -n "$git_where" ] && echo "$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_PREFIX${git_where#(refs/heads/|tags/)}$ZSH_THEME_GIT_PROMPT_SUFFIX"
#}
#function zle-line-init zle-keymap-select {
#    NORMAL="%{$fg_bold[green]%} [% NORMAL]% %{$reset_color%}"
#    INSERT="%{$fg_bold[blue]%} [% INSERT]% %{$reset_color%}"
#    RPS1="${${${KEYMAP/vicmd/$NORMAL}/(main|viins)/$INSERT}} $(git_custom_status) $EPS1"
#    zle reset-prompt
#}
#
#zle -N zle-line-init
#zle -N zle-keymap-select



# 
alias emx="emax -nw"

#setfont ter-v16n
export TERM=xterm
export TERM=xterm-256color


source $HOME/.shortcuts


export PATH="$PATH:/home/juli/.gem/ruby/2.6.0/bin"
