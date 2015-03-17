package DiceRoller::DB::SchemaDSL;
use strict;
use warnings;
use utf8;

use DBIx::Schema::DSL;

database 'MySQL';

create_table 'member' => columns {
    integer 'id',   primary_key, auto_increment;
    varchar 'name', null;
};


1;

