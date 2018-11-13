#!/usr/bin/perl -w
use strict;
@ARGV == 1 or die "Bad input format\n";
sub main(){
	foreach my $file (glob "lyrics/*.txt") {
    	cal_frequence($file, $ARGV[0]);
	}
}
sub cal_frequence(){
	my($file, $protagonist) = @_;
	my $total_num = 0;
    my $occurence = 0;
	open my $fh, "<", "$file" or die "Cannot open the file: $file\n";

	foreach my $line(<$fh>){
		chomp $line;
		my @words = split(/[^a-z]/i,$line);
		foreach my $word(@words){
			if($word =~ /[a-z]+/i){
				$total_num++;

                if(lc($word) eq lc($protagonist)){
                    $occurence+=1;
                }
            }
		}
	}

    close $fh;

    $file =~ s/lyrics\///;
    $file =~ s/.txt//;
	$file =~ s/_/ /g;
	
    my $frequence = log(($occurence+1)/ $total_num);
    printf "log((%d+1)/%6d) = %8.4f %s\n", $occurence, $total_num, $frequence, $file;
}

sub occured(){
    my($protagonist) = @_;

}
main();
