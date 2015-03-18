package DiceRoller::DB::Schema;
use strict;
use warnings;
use Teng::Schema::Declare;
table {
    name 'room';
    pk 'id';
    columns (
        {name => 'id', type => 4},
        {name => 'name', type => 12},
        {name => 'created_at', type => 11},
    );
};

1;
