#!/usr/bin/perl -w

use strict;

while(my $line = <STDIN>){
	my @words = split(" ",$line);
	foreach my $word(sort @words){
		print "$word ";
	}
	print "\n";
}
