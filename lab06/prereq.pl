#!/usr/bin/perl -w

use strict;

@ARGV >= 1 or die "Useage: ./prereq.pl COURSE\n";

foreach my $course(@ARGV){
	#not valid course code
	($course =~ /^[A-Z]{4}[0-9]{4}$/) or die "$course is not a valid course code\n";
	my $ugrad_url = "http://www.handbook.unsw.edu.au/undergraduate/courses/2018/$ARGV[0].html";
	my $pgrad_url = "http://www.handbook.unsw.edu.au/postgraduate/courses/2018/$ARGV[0].html";
	
	#print "Course code is $course\n";
	#print "This is the url: $url\n";
	
	(open my $fh, "-|", "wget -q -O- $ugrad_url $pgrad_url") or die "Cannot find this URL\n";
	
	my $found = 0;
	while(my $line = <$fh>){
		if($line =~ /Prerequisite/){
			$line =~ s/Excluded.*//;
			my @datas = ($line =~ /[A-Z]{4}[0-9]{4}/g);
			foreach my $data(@datas){
				print "$data\n";
			}
		}
	}
	
	close $fh;
}

