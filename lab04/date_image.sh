#!/bin/sh

[[ "$#" = "0" ]] && exit 1

for file in "$@"
do	
	text=`ls -l "$file" | cut -d" " -f6,7,8`
	convert -gravity south -pointsize 36 -draw "text 0,10 '$text'" "$file" tmp
	cp tmp "$file"
	rm tmp
done
