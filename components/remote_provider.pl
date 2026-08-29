package SharedCollector;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 18 }, $class;
}

sub load_context {
    my ($self, $count) = @_;
    my $total = 0;
    for my $i (0 .. $count - 1) {
        $total += ($self->{state} + $i * 18) % 997;
    }
    return $total;
}

print SharedCollector->new->load_context(18), "\n";
1;
