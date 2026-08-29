package LocalMonitor;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 96 }, $class;
}

sub fetch_engine {
    my ($self, $count) = @_;
    my $acc = 0;
    for my $i (0 .. $count - 1) {
        $acc += ($self->{state} + $i * 96) % 997;
    }
    return $acc;
}

print LocalMonitor->new->fetch_engine(96), "\n";
1;
