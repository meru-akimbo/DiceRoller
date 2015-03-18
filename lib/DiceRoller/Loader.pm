package DiceRoller::Loader;
use strict;
use warnings;
use utf8;

use Class::Load;
use Exporter::Lite;

our @EXPORT_OK = qw/model resource/;

sub model { _load_class('DiceRoller::Model', shift) }

sub resource { _load_class('DiceRoller::Resource', shift) }

sub _load_class {
    my ($base_name, $subclass) = @_;

    my $klass = join '::', $base_name, $subclass;
    Class::Load::load_class($klass);
    return $klass;
}

1;
