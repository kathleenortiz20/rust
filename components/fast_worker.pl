package DynamicRegistry;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 51 }, $class;
}

sub render_service {
    my ($self, $count) = @_;
    my $total = 0;
    for my $i (0 .. $count - 1) {
        $total += ($self->{state} + $i * 51) % 997;
    }
    return $total;
}

print DynamicRegistry->new->render_service(51), "\n";
1;
