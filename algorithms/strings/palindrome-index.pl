#!perl

use strict;
use warnings;

<STDIN>;

while ( <STDIN> ) {
   chomp;

   print palindrome_index($_), "\n";
}

# O(n) time, O(n) space
sub palindrome_index {
   my ($s) = @_;

   my @s = split //, $s; 
   foreach my $i ( 0 .. @s / 2 - 1 ) {
       next if $s[$i] eq $s[@s - $i - 1];
       return is_palindrome(@s[0..$i-1], @s[$i+1..@s-1])
           ? $i
           : @s - $i - 1;
   }

   return -1;
}

sub is_palindrome {
   my (@s) = @_;
   
   foreach my $i ( 0 .. @s / 2 - 1 ) {
       next if $s[$i] eq $s[@s - $i - 1];
       return 0;
   }
   
   return 1;
}
