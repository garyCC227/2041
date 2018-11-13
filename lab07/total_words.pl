#!/usr/bin/perl -w

use strict;
(@ARGV != 1) or exit 1;

my @temp=();
my $counter=0;

while(my $line = <STDIN>){
	@temp = split ("",$line);
	
	my $prev;
	while(@temp){
		my $curr = shift @temp;
		if($curr =~ /[a-z]/i){
			$prev = $curr;
			next;
		}
		if(defined $prev && $prev =~/[a-z]/i ){
			$counter+=1;
		}
		$prev = $curr;
	}
}

print "$counter words\n";
