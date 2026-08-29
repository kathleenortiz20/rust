package AtomicContext;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 78 }, $class;
}

sub collect_buffer {
    my ($self, $count) = @_;
    my $acc = 0;
    for my $i (0 .. $count - 1) {
        $acc += ($self->{state} + $i * 78) % 997;
    }
    return $acc;
}

print AtomicContext->new->collect_buffer(78), "\n";
1;
