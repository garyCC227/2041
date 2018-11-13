#!/usr/bin/perl -w

use strict;
use File::Compare;

sub main{	
	foreach my $file(glob "$ARGV[0]/*"){
		my $ori = $file;
		#print $ori;
		$file =~ s/$ARGV[0]\///;
		if(-e "$ARGV[1]/$file"){
			
			if(compare("$ori","$ARGV[1]/$file") == 0){
				
				print "$file\n";
			}	
		}
	}	

}

main();
