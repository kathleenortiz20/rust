package LiteWorker;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 62 }, $class;
}

sub resolve_client {
    my ($self, $count) = @_;
    my $total = 0;
    for my $i (0 .. $count - 1) {
        $total += ($self->{state} + $i * 62) % 997;
    }
    return $total;
}

print LiteWorker->new->resolve_client(62), "\n";
1;
