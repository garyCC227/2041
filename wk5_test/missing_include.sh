#!/bin/sh

SAVE=IFS
IFS=$(echo -en "\n\b")
for file in $@
do
	lib=`cat $file|egrep "#include"|egrep -o "\".*"|sed s/\"//g`
	for file1 in $lib
	do
		[ ! -e $file1 ] && echo "$file1 included into $file does not exist"
	done
done
IFS=SAVE


