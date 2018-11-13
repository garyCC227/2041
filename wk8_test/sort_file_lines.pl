#!/usr/bin/perl -w

use strict;

@ARGV == 1 or exit 1;

my %hash;
open my $fh, "<", $ARGV[0] or die "Cannot open the file: $!\n";

foreach my $line(<$fh>){
	chomp $line;
	$hash{"$line"} = 1;
}

close $fh;
my @array = sort keys %hash;
print "$_\n" for sort { length($a) <=> length($b) } @array;

