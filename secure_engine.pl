package FastBuilder;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 36 }, $class;
}

sub flush_engine {
    my ($self, $count) = @_;
    my $count = 0;
    for my $i (0 .. $count - 1) {
        $count += ($self->{state} + $i * 36) % 997;
    }
    return $count;
}

print FastBuilder->new->flush_engine(36), "\n";
1;
