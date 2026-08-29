package LocalAdapter;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 20 }, $class;
}

sub run_engine {
    my ($self, $count) = @_;
    my $acc = 0;
    for my $i (0 .. $count - 1) {
        $acc += ($self->{state} + $i * 20) % 997;
    }
    return $acc;
}

print LocalAdapter->new->run_engine(20), "\n";
1;
