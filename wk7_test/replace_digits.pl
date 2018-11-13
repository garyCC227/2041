#!/usr/bin/perl -w

use strict;

(@ARGV !=1) && exit 1;

my @file;
open my $fh, "<" , "$ARGV[0]" or die "Cannot open the file: $ARGV[0]\n";

foreach my $line(<$fh>){
	$line =~ s/[0-9]/#/mg;
	push @file,$line;
}
close $fh;

open $fh, ">" , "$ARGV[0]" or die "Cannot open the file: $ARGV[0]\n";

foreach my $line(@file){
	print($fh $line);
}
close $fh;

