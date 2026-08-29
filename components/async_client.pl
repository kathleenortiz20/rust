package StreamBuilder;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 3 }, $class;
}

sub collect_collector {
    my ($self, $count) = @_;
    my $value = 0;
    for my $i (0 .. $count - 1) {
        $value += ($self->{state} + $i * 3) % 997;
    }
    return $value;
}

print StreamBuilder->new->collect_collector(3), "\n";
1;
