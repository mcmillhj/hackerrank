# Enter your code here. Read input from STDIN. Print output to STDOUT
use Data::Dumper;

sub uniq {
    my @elements = @_;
    my %h;
    $h{$_}++ foreach @elements;

    return keys %h;
}

my %elem_freq;
my $num_rocks = <>;
chomp($num_rocks);
my $lines_read = 0;
my $i = 1;
while ( my $rock = <> ) {
    chomp($rock);
    $elem_freq{$_}++ foreach uniq(split //, $rock);
}

my $gemstones = 0;
foreach my $element ( keys %elem_freq ) {
    $gemstones++ if $elem_freq{$element} == $num_rocks;
}
print "$gemstones\n";
