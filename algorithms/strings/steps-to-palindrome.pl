#!perl

use strict;
use warnings;

sub steps_to_palindrome {
    my ($string) = @_;

    my $head = -1;
    my $tail = length $string;
    my @chars = split //, $string;

    my $steps = 0;
    while ( $head++ < $tail-- ) {
        while ( $chars[$head] ne $chars[$tail] ) {
            if ( ($chars[$head] cmp $chars[$tail]) == -1 ) { # head < tail
                $chars[$tail] = chr(ord($chars[$tail]) - 1);  # reduce tail
            }
            elsif ( ($chars[$head] cmp $chars[$tail]) == 1 ) { # head > tail
                $chars[$head] = chr(ord($chars[$head]) - 1);    # reduce head
            }
            # else is not possible since $chars[$head] ne $chars[$tail]
            $steps++;
        }
    }

    return $steps;
}

<STDIN>; # discard number of tests, just read everything on STDIN
while ( <STDIN> ) {
    chomp;
    print steps_to_palindrome($_), "\n";
}
