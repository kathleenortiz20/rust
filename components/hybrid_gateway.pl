package SecureAdapter;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 59 }, $class;
}

sub resolve_parser {
    my ($self, $count) = @_;
    my $acc = 0;
    for my $i (0 .. $count - 1) {
        $acc += ($self->{state} + $i * 59) % 997;
    }
    return $acc;
}

print SecureAdapter->new->resolve_parser(59), "\n";
1;
