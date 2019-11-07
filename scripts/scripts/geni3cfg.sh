#!/bin/zsh

set -e 


### Remove the link  
function prepare() {
  file=$1
  if [ -L $file ]; then 
    rm $file;
    echo "[DBG] removing link $file "
  else 
    if [[ -a $file ]]; then
      echo "[ERR] $file exists and is not a link!"
      exit -1 
    else 
      echo "[INF] $file does not exist"
    fi
  fi
}

fileLow="$HOME/.config/i3/config.low"
fileStandard="$HOME/.config/i3/config.standard"

# XXX:
prepare $fileLow
prepare $fileStandard

# config.low.$(date)
# config.standard.$(date)

termin=$(date "+%Y_%m_%d_%H_%M_%s")
fileLowNew="$fileLow.$termin"
fileStandardNew="$fileStandard.$termin"

if [[ -a $fileLowNew ]]; then
  echo "[ERR] $fileLowNew exists and is not a link!"
  exit -1 
fi
if [[ -a $fileStandardNew ]]; then
  echo "[ERR] $fileStandardNew exists and is not a link!"
  exit -1 
fi

# XXX: concatenate 
echo "$fileLowNew $fileStandardNew"

# 
#             general
#                |
#                |
#             custom
#            /       \
#           /         \
#          /           \
#         /             \
#   general low    general standard
#        |               |
#        |               |
#        |               |
#        |               |
#   custom low     custom standard
# 


# list of all files
fileGeneral="$HOME/.config/i3/general.config"
fileCustom="$HOME/.config/i3/custom.config"
fileGeneralLow="$HOME/.config/i3/generalLow.config"
fileCustomLow="$HOME/.config/i3/customLow.config"
fileGeneralStandard="$HOME/.config/i3/generalStandard.config"
fileCustomStandard="$HOME/.config/i3/customStandard.config"


# Cat the files
cat $fileGeneral > $fileLowNew
cat $fileGeneral > $fileStandardNew

cat $fileCustom >> $fileLowNew
cat $fileCustom >> $fileStandardNew

cat $fileGeneralLow >> $fileLowNew
cat $fileCustomLow >> $fileLowNew

cat $fileGeneralStandard >> $fileStandardNew
cat $fileCustomStandard >> $fileStandardNew


# create the link
ln -s $fileStandardNew $fileStandard
ln -s $fileLowNew $fileLow


