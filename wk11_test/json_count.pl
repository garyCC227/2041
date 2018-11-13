#!/usr/bin/perl
use strict;
use warnings;
binmode STDOUT, ":utf8";
use utf8;
use JSON;
use Data::Dumper;

sub read_json{
    my($specie, $file) = @_;
    my $json;
    {
      local $/; #Enable 'slurp' mode
      open my $fh, "<", "$file";
      $json = <$fh>;
      close $fh;
    }
    my @data = @{decode_json($json)};
    my $len = scalar @data;
    my $count = 0;
    #read the json data now
    for(my $i=0; $i<$len; $i++){
        if ($specie =~ /$data[$i]->{'species'}/i){
            $count += $data[$i]->{'how_many'};
        }
    }

    print "$count\n";
}

sub main{
    my $specie = $ARGV[0];
    my $file = $ARGV[1];
    read_json($specie, $file);
}

main();
