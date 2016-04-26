#!perl

use strict;
use warnings;

use feature qw(say);

my ($alphabet_regex) = map { qr/$_/ } join '', map { "[$_]+"} ('a'..'z');
sub is_pangram {
    my ($s) = @_;

    # remove all whitespace
    $s =~ s/\s+//g;

    return (join '', sort split //, lc $s) =~ $alphabet_regex;
}

while ( <STDIN> ) {
    chomp;
    say is_pangram($_)
        ? 'pangram'
        : 'not pangram';
}
