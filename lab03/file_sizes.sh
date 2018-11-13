#!/bin/bash

SMALL="Small files:"
MED="Medium-sized files:"
LARG="Large files:"

for i in *
do
	line=`wc -l < $i`
	if [ $line -lt 10 ];then
		SMALL+=" $i"
	elif [ $line -lt 100 ];then
		MED+=" $i"
	else
		LARG+=" $i"
	fi
done

echo $SMALL
echo $MED
echo $LARG
