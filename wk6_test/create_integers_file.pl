#!/usr/bin/perl -w

use strict;

@ARGV >=3 or die "bad agrument\n";
$ARGV[0] !~ /d+/ or die "First agrument $ARGV[0] should be integer\n";
$ARGV[1] !~ /d+/ or die "Second agrument $ARGV[1] should be integer\n";
$ARGV[2] =~ /[A-Z.]/i or die "Third agrument $ARGV[2] should be String\n";

open my $fh, ">" , "$ARGV[2]" or die "Cannot open the file: $ARGV[2]\n";
for(my $i=$ARGV[0]; $i <= $ARGV[1];$i++){
	print $fh "$i\n";
}
close $fh;

