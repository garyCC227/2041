#!/bin/sh

for file in *.jpg
do
	if find "${file%.*}.png" > /dev/null 2>&1
    then
        echo "${file%.*}.png" already exists
        exit 1
    fi
	convert "$file" "${file%.*}.png"
	rm "$file"
done
