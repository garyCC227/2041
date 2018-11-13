#!/usr/bin/perl -w
@array = (1);
$i = 3;
while(@array){
	
	my $first = shift @array;
	print "$first\n";
	$string = "1";
	push @array, $string;
	}
