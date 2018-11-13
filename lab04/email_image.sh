#!/bin/sh

[["$#" = "0"]] && exit 1

for file in "$@"
do
	echo Address to e-mail this image to?
	read addr
	echo Message to accompany image?
	read mess
	echo "$mess" |  mutt -s "$mess" -a $file --$addr
	echo "$file" sent to "$addr"
done
