#!/usr/bin/perl -w

use strict;

@ARGV == 1 or die "Where is the file???\n";

open my $fh, "<", "$ARGV[0]" or die "Cannot open the file: $! \n";

foreach my $line(<$fh>){
	chomp $line;
	#ignore the empty line
	if($line =~ /^\s*$/){
		next;
	}
	
	#enviroment line
	if($line =~ s/\/bin\/bash/\/usr\/bin\/perl -w/){
		print "$line\n";
		next;
	}
	
	#translating varibles format
	if($line =~ /^[a-z]+=/i){
		$line = "\$".$line;			
		print "$line".";"."\n";
		next;

	}
	
	#for while loop
	if($line =~ /while/){
		$line =~ s/\(\(/\( /;
		$line =~ s/\)\)/ \)/;
		my @temp = split (/ /,$line);
		foreach my $word(@temp){
			if($word =~ /[a-z]+/i && $word !~ /while/){
				$word = "\$".$word;
			}
		}
		
		print "@temp"."\n";
		next;
	}
	
	if($line =~ /do$/){
		$line =~ s/do/\{/;
		print "$line"."\n";
		next;

	}
	
	if($line =~ /done$/){
		$line =~ s/done/\}/;
		print "$line"."\n";
		next;
	}

	if($line =~ /[a-z]+=\$\(\(.*\)\)/i){
		$line =~ s/\(\(//;
		$line =~ s/\)\)//;
		$line =~ s/=/ = /;
		$line =~ s/\$//;
		my @temp = split(/ /, $line);
		foreach my$sub (@temp){
			if ($sub =~ /[a-zA-Z]+/){
				$sub = "\$$sub";
			}	
		}
		print "@temp;\n";
		next;
	}
	
	if($line =~ /echo/i){
		$line =~ s/  / /;
		$line =~ s/echo\s+/print "/i;
		$line = $line."\\n\"";
		print "$line;\n";
		next;
	}
	
	if($line =~ /[a-z]+=/i){
		$line =~ s/=/ = /;
		my @temp = split(/ /,$line);
		foreach my $word(@temp){
			if($word =~ /^[a-z]+/i){
				$word = "\$".$word;
			}
		}
		print "@temp;\n";
		next;
	}
	
	if($line =~ /if \(\(.*\)\)/){
		$line =~ s/\(\(/\( /;
		$line =~ s/\)\)/ \)/;
		my @temp = split(/ /,$line);
		foreach my $word(@temp){
			if($word =~ /[a-z]+/i && $word !~ /if/){
				$word = "\$".$word;
			}
		}
		print "@temp\n";
		next;
	}
	
	if($line =~ /then$/){
		$line =~ s/then/\{/;
		print "$line\n";
		next;
	}
	
	if($line =~ /fi$/){
		$line =~ s/fi/\}/;
		print "$line\n";
		next;
	}
	
	if($line =~ /else$/){
		$line = "\} else \{";
		print "$line\n";
		next;
	}
}

close $fh; 
