#!/usr/bin/perl 

use strict;
use warnings;

@ARGV >= 1 or die "No file input\n";

our %total_words;
our @artists_name;
our %words_storage;

sub main(){
    #read each of the artist file, and store every word into hash table
    #and also fill the total_word into a hash table
    #and the fill the artists name into an array
    prepare();
    #print "$_ $words_storage{$_}\n" for (sort keys %words_storage);
    #cal log value for each artist file
    cal_log(@ARGV);

}
#read each aritist file and
sub prepare(){
    foreach my $artist_file(glob 'lyrics/*.txt'){
        open my $fh, "<", "$artist_file" or die "Cannot open the file: $artist_file\n";
        $artist_file =~ /(.*)(.txt)/;
        my $artist = $1;
        $artist =~ s/lyrics\///;
        #store artist name into artists_name array
        push @artists_name,$artist;

        my $total_num=0; # count the total numer of words
        foreach my $line(<$fh>){
            my @words_in_line = split(/[^a-z]/i,$line);
            foreach my $word(@words_in_line){
                if($word =~ /[a-z]+/i){
                    #%words_storage + 1
                    my $key_name = ($artist.'-'.lc($word));
                    if(exists $words_storage{$key_name}){
                        $words_storage{$key_name}+=1;
                    }else{
                        $words_storage{$key_name}=1;
                    }

                    #total number of words +1
                    if(exists $total_words{$artist}){
                        $total_words{$artist} += 1;
                    }else{
                        $total_words{$artist} = 1;
                        #print "im here\n";
                    }
                }
            }
        }
        
        close $fh;
        #print "artist is $artist\n";
    }
	#print "$_ $total_words{$_}\n" for (sort keys %total_words);
	#print "$_ $words_storage{$_}\n" for (sort keys %words_storage);
}

sub cal_log(){
	my(@files) = @_;
	#read each song?.txt file
	foreach my $file(@files){
		#hash table to store each log values for each artist file
		my %log_value;
		#print "$file\n";
		open my $fh, "<", "$file" or die "Cannot open the file: $file\n";
		
		foreach my $line(<$fh>){
			my @words = split(/[^a-z]/i, $line);
			foreach my $word(@words){
				if($word =~ /[a-z]+/i){
					
					#we get the word, then cal the log for each artist file
					foreach my $artist(@artists_name){
						my $key_name = $artist.'-'.lc($word);
						#print "$key_name\n";	
						if(exists $words_storage{$key_name}){
							my $log_for_word = log($words_storage{$key_name} / $total_words{$artist});
							
							#store into the log_val hash table
							if(exists $log_value{$artist}){
								$log_value{$artist} += $log_for_word;
							}else{
								$log_value{$artist} = $log_for_word;
								#print "im here once;\n";
							}
						}
					}
					
				}
			}
		}
		
		close $fh;
		print "$_ $log_value{$_}\n" for (sort keys %log_value);
	}
}

main();
