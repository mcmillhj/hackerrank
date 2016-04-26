#!perl

use strict;
use warnings;

use feature qw(say);

<STDIN>;

while ( <STDIN> ) {
    chomp;
    say is_funny($_)
        ? 'Funny'
        : 'Not Funny';
}

sub is_funny {
    my ($string) = @_;

    my @s = split //, $string;
    my @r_s = reverse @s;

    foreach my $i ( 1 .. $#s ) {
        return 0
            unless abs(ord($s[$i]) - ord($s[$i-1])) == abs(ord($r_s[$i]) - ord($r_s[$i-1]));
    }

    return 1;
}
