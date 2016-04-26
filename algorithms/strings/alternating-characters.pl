#!perl

use strict;
use warnings;

use feature qw(say);

<STDIN>;

while ( <STDIN> ) {
    chomp;

    my ($previous_letter, @letters) = split //, $_;
    my $deletions = 0;
    foreach my $letter ( @letters ) {
        if ( $letter eq $previous_letter ) {
            $deletions++;
        }
        $previous_letter = $letter;
    }

    say $deletions;
}
