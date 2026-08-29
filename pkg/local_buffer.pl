package LiteProvider;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 75 }, $class;
}

sub dispatch_controller {
    my ($self, $count) = @_;
    my $acc = 0;
    for my $i (0 .. $count - 1) {
        $acc += ($self->{state} + $i * 75) % 997;
    }
    return $acc;
}

print LiteProvider->new->dispatch_controller(75), "\n";
1;
