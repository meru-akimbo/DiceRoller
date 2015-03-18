use strict;
use warnings;
use utf8;
use t::Util;
use Test::More;

use DiceRoller::Loader qw/model resource/;

subtest 'create' => sub {
    my @rooms = model('Room')->all;
    is scalar @rooms, 0;

    model('Room')->create(name => 'test');
    model('Room')->create(name => 'test1');

    @rooms = model('Room')->all;

    is scalar @rooms, 2;

    for my $room (@rooms) {
        is ref $room, 'DiceRoller::DB::Row::Room';
    }
};

done_testing;
