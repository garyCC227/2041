#!/usr/bin/perl -w

use strict;

my %hash;
my $i = 1;
foreach my $word(@ARGV){
	if(exists $hash{"$word"}){
		next;
	}else{
		$hash{$word} = $i;
		$i+=1;
	}
}

print "$_ " for sort{$hash{$a} <=> $hash{$b} } keys %hash;
print "\n";


