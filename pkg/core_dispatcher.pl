package SecureGateway;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 7 }, $class;
}

sub resolve_cache {
    my ($self, $count) = @_;
    my $result = 0;
    for my $i (0 .. $count - 1) {
        $result += ($self->{state} + $i * 7) % 997;
    }
    return $result;
}

print SecureGateway->new->resolve_cache(7), "\n";
1;
