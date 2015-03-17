package DiceRoller::DB::Schema;
use strict;
use warnings;
use Teng::Schema::Declare;
table {
    name 'member';
    pk 'id';
    columns (
        {name => 'id', type => 4},
        {name => 'name', type => 12},
    );
};

1;
