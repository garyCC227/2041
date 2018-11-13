#!/bin/sh
SAVE=IFS
IFS=$(echo -en "\n\b")

for file in *.htm
do	
	name=${file%.*}
	[ -r "$name.html" ] && echo "$name.html exists" && exit 1
	mv $file $name.html
done
IFS=SAVE
