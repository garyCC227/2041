#!/usr/bin/perl -w
foreach $arg (@ARGV) {
    if ($arg eq "--version") {
        print "$0: version 0.1\n";
        exit 0;
    }elsif($arg =~ /^-[0-9]+/) {
		$line = $arg ;
		$line =~ s/-//;
    }else {
        push @file, $arg;
    }
}
foreach my $f (@file) {
    open F, '<', $f or die "$0: Can't open $f: $!\n";
    @array = <F>;
    if($#file > 1){
	print "==> $f <==\n"
    }
    if($line){   
	$offset = ($line > $#array) ? 0 : $#array - $line +1;
    }else{
    	$offset = ($#array > 9) ? $#array - 9 : 0;
    }

    foreach my $data (@array[$offset..$#array]){
	print $data;
    }
    close F;
}

if(@ARGV == 0){
    @a = <STDIN>;
    for($i = ($#a > 9) ? $#a - 9 : 0; $i <= $#a; ++$i){
    	 print $a[$i];
    }
}
