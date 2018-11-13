#!/bin/sh

cat $1 | egrep "COMP[29]041" |
uniq |
cut -d'|' -f3|
egrep -o -i ", [a-z]+" |
sed "s/, //g" |
sort |
uniq -c |
sort -n -k1 |
tail -1 |
egrep -o -i "[a-z]+"
