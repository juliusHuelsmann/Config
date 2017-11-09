# This file contains utility scripts for copying around the 
# configuration files of various different tools from one 
# machine to the other

xcp () {
	if [ $1 -nt $2 ]
		then 
			cp $1 $2
			echo "Copied successfully $1 to $2."
		else
			echo "Not copied: The file that is to be overwritten is newer than the configuration file inside the repository."
			echo "tried to overwrite:  $2"
			echo "new file:            $1"
	fi
	
}


cp2conf() {

	# the destination and config file
	destin=$2
	conf=$1

	mkdir $destin

	# that is so damn ugly and does not generalize
#	# XXX 	
	len=${#conf}
	ind=${conf%/*}
	ind=${#ind}
	ind=$((ind+2))
	apnd=$(echo $conf | cut -c $ind-$len)
	echo $apnd
	xcp $1 "$2$apnd"
}


