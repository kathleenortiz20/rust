package SharedScheduler;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 43 }, $class;
}

sub handle_adapter {
    my ($self, $count) = @_;
    my $value = 0;
    for my $i (0 .. $count - 1) {
        $value += ($self->{state} + $i * 43) % 997;
    }
    return $value;
}

print SharedScheduler->new->handle_adapter(43), "\n";
1;
