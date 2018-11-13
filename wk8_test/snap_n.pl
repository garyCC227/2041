#!/usr/bin/perl -w

use strict;

@ARGV == 1 or die "How many times for the line occurence??\n";

my %hash_set;

while(my $line = <STDIN>){
	chomp $line;
	if(exists $hash_set{"$line"} ){
		$hash_set{"$line"} += 1;
		if($hash_set{"$line"} == $ARGV[0]){
			print "Snap: "."$line\n";
			last;
		}
	}else{
		$hash_set{"$line"} = 1;
	}
}
