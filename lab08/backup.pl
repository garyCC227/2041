#!/usr/bin/perl -w

use strict;

@ARGV ==1 or die;

my $content = "";

open my $fh ,"<", "$ARGV[0]" or die "Not such a file $ARGV[0]\n";

foreach my $line(<$fh>){
	$content .= $line;
}

close $fh;

my $dot = ".";
my $i = 0;
my $nf_old = $dot.$ARGV[0].$dot;
my $nf_name = $dot.$ARGV[0].$dot."$i";

while(-e $nf_name){	
	$nf_name = $nf_old;
	$i+=1;
	$nf_name .= $i;
}


open $fh, ">", "$nf_name" or die;

print $fh $content;

close $fh;


print "Backup of '$ARGV[0]' saved as '$nf_name'\n"; 
