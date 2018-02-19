# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

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
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias sz="source ~/.zshrc"
alias cdRepo="cd /mnt/data/repos"
alias cdrep="cd /mnt/data/repos; addSshAgent; "
alias cdrepo="cdRepo"
ws4="/mnt/data/repos/4-ws1718"
ws4Raw="/mnt/data/repos/4-ws1718Raw"
alias cds="cd /mnt/data/repos/4-ws1718"
alias cdsr="cd /mnt/data/repos/4-ws1718Raw"
alias uni="cdsr; daemonize termite -d $ws4"
alias aim="cd $ws4Raw/aim; daemonize termite -d '$ws4/aim'"
alias bkits="cd $ws4Raw/bkits; daemonize termite -d '$ws4/bkits'"
alias netsec="cd $ws4Raw/netsec; daemonize termite -d '$ws4/netsec'"
alias seclab="cd $ws4Raw/seclab; daemonize termite -d '$ws4/seclab'"
alias osd="cd $ws4Raw/osd; daemonize termite -d '$ws4/osd'"
alias bri="sudo chown juli /sys/class/backlight/intel_backlight/brightness"
alias scanHome="scanimage --device 'hpaio:/usb/OfficeJet_4650_series?serial=TH5AE2J0KV0662' --format=png --resolution 300"
alias mirror="convert -rotate 180"
alias mirrorAll="for f in *.png; do echo $f; convert -rotate 180 $f $f; done"

repo=/mnt/data/repos
dima=$repo/dima/SenseNative
bahn=$repo/deutscheBahn/ipa

alias cdipa="cdrep; cd $bahn";
alias cdsense="cdrep; cd $dima";

alias dipa="cdipa;vim;";
alias dsense="cdsense;vim";

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
alias cdreading="cd /mnt/data/repos/Readings"
alias lspdf="lsPdf"
#alias push="ssh-add; git push"
#alias pull="ssh-add; git pull"
alias puh="git add .; git commit -am \"provided partial solution for comparison\"; git push;"
alias clion=/mnt/arch/home/juli/programs/clion-2016.3.2/bin/clion.sh

# local 
localarcht=juli@192.168.178.67
localarchx=juli@192.168.178.32
localosx=x@192.168.178.20

alias ssharcht='ssh -X $localarcht'
alias ssharchx='ssh -X $localarchx'
alias sshosx='ssh -X $localosx'

# This command must run each time terminal opens for 
# using ssh-add
#

function scposx() {
  scp $1 $localosx:$2
}
function scparcht() {
  scp $1 $localarcht:$2
}
function scparchx() {
  scp $1 $localarchx:$2
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
 cat /mnt/data/repos/Readings/tasks.mdpp | tail -n $k
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
}



function genHash() {
  echo -n $1 | iconv -t utf16le | openssl md4
}


# Sets the Mail Environemnt Variable 
# (was done during the installation of procmail for using the mutt client)
MAIL=/var/spool/mail/juli && export MAIL

export PATH=$PATH:/mnt/data/repos/programs/gcc-linaro-7.1.1-2017.08-i686_arm-linux-gnueabihf/bin/
export PATH=$PATH:/home/juli/.gem/ruby/2.4.0/bin
export PATH=$PATH:/usr/local/spark/bin

export SPARK_HOME=/usr/lib/python3.6/site-packages/pyspark


