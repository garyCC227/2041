#!/usr/bin/perl -w

use strict;

sub main{
	
	my @array = sort {$a <=> $b}@ARGV;
	
#	print "@array\n";
	my $median =int( scalar(@array) / 2);
	

	print "$array[$median]\n";

}

main();
