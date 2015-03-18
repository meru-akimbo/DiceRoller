package DiceRoller::DB::SchemaDSL;
use strict;
use warnings;
use utf8;

use DBIx::Schema::DSL;

database 'MySQL';

create_table 'room' => columns {
    integer 'id',   primary_key, auto_increment;
    varchar 'name', not_null;
    datetime 'created_at', not_null;
};


1;

