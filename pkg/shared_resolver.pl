package LocalProvider;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 53 }, $class;
}

sub handle_provider {
    my ($self, $count) = @_;
    my $acc = 0;
    for my $i (0 .. $count - 1) {
        $acc += ($self->{state} + $i * 53) % 997;
    }
    return $acc;
}

print LocalProvider->new->handle_provider(53), "\n";
1;
