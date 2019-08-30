
path=/home/pi/.ssh/authorized_keys
myDir=~/.ssh/id_rsa.pub 
for var in "$@"; do
  echo  "scp -r $myDirmyDir $var:$path"
  scp -r $myDir $var:$path
  #rsync -ru $myDirmyDir $var:$path
done


