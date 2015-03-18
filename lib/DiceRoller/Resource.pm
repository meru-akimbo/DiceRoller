package DiceRoller::Resouce;
use strict;
use warnings;
use utf8;

use DiceRoller;

sub c { DiceRoller->context }

sub db {
    shift->c->db;
}

sub redis {
    shift->c->redis;
}

1;
