#!perl

use strict;
use warnings;

use feature qw(say);
use List::Util qw(max);

<STDIN>;

while ( <STDIN> ) {
    chomp;

    say steps_to_anagram2(partition($_));
}

sub partition {
    my ($string) = @_;

    my @s1;
    my @s2 = split //, $string;
    while ( abs(@s1 - @s2) > 1 ) {
        push @s1, pop @s2;
    }

    return (
        join('', @s1),
        join('', @s2),
    );
}

# O(n) space, O(n) time
sub steps_to_anagram {
    my ($s1, $s2) = @_;

    return -1
        unless length($s1) == length($s2);

    my %s1;
    map { $s1{$_}++ } split //, $s1;
    my %s2;
    map { $s2{$_}++ } split //, $s2;

    my $differences = 0;
    foreach my $c ( keys %s2 ) {
        $differences += exists $s1{$c}
        ? max(0, $s2{$c} - $s1{$c})
            : $s2{$c};
    }

    return $differences;
}

# O(1) space, O(n) time
sub steps_to_anagram2 {
    my ($s1, $s2) = @_;

    return -1
        unless length($s1) == length($s2);

    my @letters;
    $#letters = 26;

    foreach my $c ( split //, $s2 ) {
        my $code = ord($c) - ord('a');
        $letters[$code]++;
    }
    foreach my $c ( split //, $s1 ) {
        my $code = ord($c) - ord('a');
        next unless $letters[$code];
        $letters[$code]--;
    }

    my $differences = 0;
    foreach my $c ( grep { $_ } @letters ) {
        $differences += abs($c);
    }

    return $differences;
}
