#!/bin/sh

[ $# != 1 ] && exit 0

dot="."
i=0

while true
do
	if [ -f "$dot$1$dot$i" ]
	then
		((i = i + 1))
	else
		echo "Backup of '$1' saved as '$dot$1$dot$i'"
		cp $1 $dot$1$dot$i
		break
	fi
	
done
 
