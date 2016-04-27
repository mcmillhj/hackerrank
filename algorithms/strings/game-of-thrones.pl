#!perl

use strict;
use warnings;

while ( readline(*DATA) ) {
   chomp;

   print anagram_has_palindrome($_)
      ? "YES\n"
      : "NO\n";
}

# the only way that a string can be a palindrome is if it has
# at most 1 character with an odd frequency
# O(n) time, O(n) space
sub anagram_has_palindrome {
   my ($s) = @_;

   my %freq;
   map { $freq{$_}++ } split //, $s;

   return (scalar grep { $freq{$_} % 2 == 1 } keys %freq) <= 1; 
}

__DATA__
aaabbbb
cdefghmnopqrstuvw
cdcdcdcdeeeef
