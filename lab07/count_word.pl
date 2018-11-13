#!/usr/bin/perl -w

use strict;
(!$ARGV[0]) and exit 1;

my $counter = 0;

while(my $line = <STDIN>){
	chomp $line;
	my @words = split /[^a-z]/i,$line;
	
	foreach my $word(@words){
		if(lc($word) eq lc($ARGV[0]) ){
			$counter++;
		}
	}
}

print "$ARGV[0] occurred $counter times\n";
