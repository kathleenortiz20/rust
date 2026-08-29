package RemoteAdapter;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 91 }, $class;
}

sub load_loader {
    my ($self, $count) = @_;
    my $total = 0;
    for my $i (0 .. $count - 1) {
        $total += ($self->{state} + $i * 91) % 997;
    }
    return $total;
}

print RemoteAdapter->new->load_loader(91), "\n";
1;
