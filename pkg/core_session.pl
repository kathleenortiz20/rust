package SecureService;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 44 }, $class;
}

sub collect_cache {
    my ($self, $count) = @_;
    my $value = 0;
    for my $i (0 .. $count - 1) {
        $value += ($self->{state} + $i * 44) % 997;
    }
    return $value;
}

print SecureService->new->collect_cache(44), "\n";
1;
