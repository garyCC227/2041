#!/usr/bin/perl -w

use strict;

@ARGV >= 1 or die "Useage: ./prereq.pl -r COURSE\n";
my @close_set =();
my @open_set = ();
our $first_course = "";

if(@ARGV == 1 && ($ARGV[0] =~ /^[A-Z]{4}[0-9]{4}$/) ){
	$first_course = $ARGV[0];
}elsif(@ARGV == 2 && $ARGV[0] ne "-r"){
	die "Useage: ./prereq.pl -r COURSE\n";
}elsif(@ARGV == 2 && $ARGV[0] eq "-r"){
	$first_course = $ARGV[1];
}
push @open_set, $first_course;

while(@open_set){
	my $course = shift @open_set;
	my $seen = 0;
	foreach my $element1(@close_set){
		if($course eq $element1){
			$seen = 1;
			last;
		}
	}
	if($seen == 1){next;};
	
	push @close_set, $course;
	#not valid course code
	($course =~ /^[A-Z]{4}[0-9]{4}$/) or die "$course is not a valid course code\n";
	my $ugrad_url = "http://www.handbook.unsw.edu.au/undergraduate/courses/2018/$course.html";
	my $pgrad_url = "http://www.handbook.unsw.edu.au/postgraduate/courses/2018/$course.html";
	(open my $fh, "-|", "wget -q -O- $ugrad_url $pgrad_url") or die "Cannot find this URL\n";

	while(my $line = <$fh>){
		if($line =~ /Prerequisite/){
			$line =~ s/Excluded.*//;
			my @datas = ($line =~ /[A-Z]{4}[0-9]{4}/g);
			foreach my $data(@datas){
				#used?? for every data
				my $used = 0;
				#check if this course code we already used
				foreach my $element(@close_set){
					if($data eq $element){
						$used = 1;
						last;
					}
					#always assign $used to 0, if we didnt find it used before
					$used = 0;
				}
				
				if($used == 0){
					push @open_set,$data;
					#print "$data\n";
				}
			}
		}
	}

	close $fh;
}




foreach my $data(sort @close_set){
	if($data eq $first_course){
		next;
	}
	print "$data\n";
}
