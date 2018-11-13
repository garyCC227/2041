#!/usr/bin/perl -w

if(($#ARGV + 1) != 2){
	die "Usage: ./echon.pl <number of lines> <string>\n";
}elsif( $ARGV[0] !~ /\d+/ || $ARGV[0] < 0 ){
	die "./echon.pl: argument 1 must be a non-negative integer\n";
}

$i=0;

while($i < $ARGV[0]){
	print "$ARGV[1]\n";
	$i+=1;
}
