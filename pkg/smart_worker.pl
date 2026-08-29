package HybridContext;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 4 }, $class;
}

sub build_router {
    my ($self, $count) = @_;
    my $result = 0;
    for my $i (0 .. $count - 1) {
        $result += ($self->{state} + $i * 4) % 997;
    }
    return $result;
}

print HybridContext->new->build_router(4), "\n";
1;
