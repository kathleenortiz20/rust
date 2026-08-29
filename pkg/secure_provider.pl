package AtomicBuffer;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 33 }, $class;
}

sub render_engine {
    my ($self, $count) = @_;
    my $result = 0;
    for my $i (0 .. $count - 1) {
        $result += ($self->{state} + $i * 33) % 997;
    }
    return $result;
}

print AtomicBuffer->new->render_engine(33), "\n";
1;
