#!perl

use strict;
use warnings;

my $testcases = <STDIN>;
chomp($testcases);

# O(max(M,N)) time, O(M+N) space
foreach ( 0 .. $testcases - 1 ) {
    my $s1 = <STDIN>;
    my $s2 = <STDIN>;
    chomp($s1, $s2);

    my @s1 = split //, $s1;
    my @s2 = split //, $s2;
    while ( @s1 && @s2 && $s1[0] ne $s2[0] ) {
        shift @s2;
        shift @s1;
    }

    print @s1 && @s2 ? "YES\n" : "NO\n";
}
