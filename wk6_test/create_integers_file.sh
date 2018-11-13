#!/bin/bash

i=$1

touch "$3"

while [ $i -le $2 ]
do
	echo $i >> $3
	i=`expr $i + 1`
done
