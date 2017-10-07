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
alias cdRepo="cd /mnt/data/repos"
alias cdrep="cd /mnt/data/repos; addSshAgent; "
alias cdrepo="cdRepo"
repo=/mnt/data/repos
dima=$repo/dima/SenseNative
bahn=$repo/deutscheBahn/ipa

alias cdipa="cdrep; cd $bahn";
alias cdsense="cdrep; cd $dima";

alias dipa="cdipa;vim;";
alias dsense="cdsense;vim";

alias lt="ls -lt"
alias x="exit"
#alias push="ssh-add; git push"
#alias pull="ssh-add; git pull"
alias puh="git add .; git commit -am \"provided partial solution for comparison\"; git push;"
alias clion=/mnt/arch/home/juli/programs/clion-2016.3.2/bin/clion.sh

# This command must run each time terminal opens for 
# using ssh-add



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
function daemonize() {
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
  docker run \
    --link sentry-redis:redis \
    --link sentry-postgres:postgres \
    --link sentry-smtp:smtp \
    --env SENTRY_SECRET_KEY=$SENTRY_SECRET_KEY \
    --rm -it sentry-onpremise upgrade
}

function sentryDeployRun() {
  export SENTRY_SECRET_KEY="phz2reaw4sj@m6a*9bwd!h0cv(0&tl53%5*5vqmn6@o7m3rgjx"

  # run web client
  docker run \
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
  docker run \
    --link sentry-redis:redis \
    --link sentry-postgres:postgres \
    --link sentry-smtp:smtp \
    --env SENTRY_SECRET_KEY=$SENTRY_SECRET_KEY \
    --detach \
    --name sentry-worker-01 \
    sentry-onpremise \
    run worker

  docker run \
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

  docker start sentry-postgres sentry-redis sentry-smtp
  docker start sentry-worker-01 sentry-cron sentry-web-01
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





# Sets the Mail Environemnt Variable 
# (was done during the installation of procmail for using the mutt client)
MAIL=/var/spool/mail/juli && export MAIL




