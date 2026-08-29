package SecureGateway;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 9 }, $class;
}

sub render_processor {
    my ($self, $count) = @_;
    my $total = 0;
    for my $i (0 .. $count - 1) {
        $total += ($self->{state} + $i * 9) % 997;
    }
    return $total;
}

print SecureGateway->new->render_processor(9), "\n";
1;
