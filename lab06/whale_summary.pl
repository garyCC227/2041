#!/usr/bin/perl -w

use strict;

my $fn=$ARGV[0];
my %pod = ();
my %count_species = ();


#start to read file
open my $f, "<", "$fn" or die "Cannot open file $fn: $!\n";

foreach my $line(<$f>){
	chomp $line;
	my @split_line = split / /, $line;
	my $curr_num = shift @split_line;
	my $curr_name = join " ", @split_line;
	$curr_name =~ tr/A-Z/a-z/;
	$curr_name =~ s/ +/ /g;
	$curr_name =~ s/s$//g;
	$curr_name =~ s/^ //;
	$curr_name =~ m/^(\d+)\s(.*)$/;
	my $specie = $2;
	my $specie_counter = $1;
	if (exists $pod{$specie} && $count_species{$specie}){
		$pod{$specie} += 1;
		$count_species{$specie} += $specie_counter;
	}else{
		$pod{$specie} = 1;
		$count_species{$specie} = $specie_counter;
	}
}

close $f;

foreach my $key(sort keys %pod){
	print "$key observations: $pod{$key} pods, $count_species{$key} individuals\n";
}
