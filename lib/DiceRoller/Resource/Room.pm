package DiceRoller::Resource::Room;
use strict;
use warnings;
use utf8;
use 5.18.0;
use parent qw/DiceRoller::Resource/;

use Data::Validator;

sub create {
    state $v = Data::Validator->new(
        name => 'Str',
    )->with(qw/Method/);
    my($class, $args) = $v->validate(@_);

    my $now = $class->c->now->from_mysql_date_time;
    $class->db->insert('room', +{ %$args, created_at => $now});
}

1;
