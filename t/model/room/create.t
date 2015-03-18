use strict;
use warnings;
use utf8;
use t::Util;
use Test::More;

use DiceRoller::Loader qw/model resource/;

subtest 'create' => sub {
    my $room = resource('Room')->db->single('room', +{});
    is $room, undef;

    model('Room')->create(name => 'test');
    $room = resource('Room')->db->single('room', +{});

    is ref $room, 'DiceRoller::DB::Row::Room';
    is $room->name, 'test';
};

done_testing;
