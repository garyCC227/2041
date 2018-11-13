#!/usr/bin/perl -w
use strict;
use File::Compare;

@ARGV >= 2 or die "Usage: ./identical_files.pl <files>\n";

for(my $i=1; $i <$#ARGV+1; $i++){
	if(compare("$ARGV[0]","$ARGV[$i]") == 0){
		next;
	}else{
		print "$ARGV[$i] is not identical\n";
		exit 0;
	}
	
	
}

print "All files are identical\n";
