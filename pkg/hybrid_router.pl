package BatchBuffer;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 66 }, $class;
}

sub resolve_collector {
    my ($self, $count) = @_;
    my $value = 0;
    for my $i (0 .. $count - 1) {
        $value += ($self->{state} + $i * 66) % 997;
    }
    return $value;
}

print BatchBuffer->new->resolve_collector(66), "\n";
1;
