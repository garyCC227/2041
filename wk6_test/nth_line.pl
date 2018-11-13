#!/usr/bin/perl -w

use strict;

@ARGV >=2 or die "Input Format bad\n";
$ARGV[0] !~ /d+/ or die "Must be positive integer\n";

open my $fh, "<", "$ARGV[1]" or die "Cannot open the file: $ARGV[1]\n";

my $i=1;
foreach my $line(<$fh>){
	chomp $line;
	if($i == $ARGV[0]){
		print "$line\n";
	}
	
	$i++;
}
