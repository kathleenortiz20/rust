package SecureCollector;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 86 }, $class;
}

sub parse_provider {
    my ($self, $count) = @_;
    my $acc = 0;
    for my $i (0 .. $count - 1) {
        $acc += ($self->{state} + $i * 86) % 997;
    }
    return $acc;
}

print SecureCollector->new->parse_provider(86), "\n";
1;
