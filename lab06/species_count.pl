#!/usr/bin/perl 

use warnings;
use strict;

our $species = "";
our $fn = "";

for(my $i=0; $i<$#ARGV+1; $i++){
	if($i ==0){
		$species = $ARGV[$i];
	}elsif($i != $#ARGV){
		$species = join(" ",$species,$ARGV[$i]);
	}else{
		$fn = $ARGV[$i];	
	}
}

our @match = ();

open my $f, "<","$fn" or die "Cannot open file $fn: $!\n";

foreach my $line(<$f>){
	chomp $line;
	push (@match, $line)if $line =~ m/(.*)\s+(\d+)\s+($species)/;
	
}
close $f;

my $count_pod = 0;
my $count_species = 0;
foreach my $element(@match){
	$element =~ m/(.*)\s+(\d+)\s+($species)/i;
	$count_pod += 1;
	$count_species += $2;
}

print "$species observations: $count_pod pods, $count_species individuals\n";
