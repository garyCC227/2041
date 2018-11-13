#!/bin/sh

dir1=$1
dir2=$2

for file in $dir1/*
do
	temp=$(basename -- "$file")
		#echo "$dir2"
	if [ -e "$dir2/$temp" ]; then
		if cmp -s "$file" "$dir2/$temp";then
			echo "$temp"
		fi	
	fi
done
