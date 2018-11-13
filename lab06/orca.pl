#!/usr/bin/perl 

use warnings;
use strict;

foreach my $fn(@ARGV){
	open my $f, "<", "$fn" or die "Cannot open file $fn: $!\n";
	my $count = 0;
	foreach my $line(<$f>){
		chomp $line;
		$count += $2 if $line =~ m/(.*)\s+(\d+)\s+(orca)/i;
		
	}
	print "$count Orcas reported in $fn\n";
	close $f;
}
