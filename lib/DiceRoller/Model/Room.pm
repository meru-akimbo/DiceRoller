package DiceRoller::Model::Room;
use strict;
use warnings;
use utf8;
use 5.18.0;
use parent qw/DiceRoller::Model/;

use DiceRoller::Loader qw/resource/;

use Data::Validator;

sub create {
    state $v = Data::Validator->new(
        name => 'Str',
    )->with(qw/Method/);
    my($class, $args) = $v->validate(@_);

    resource('Room')->create(%$args);
}

1;
