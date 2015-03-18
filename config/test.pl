+{
    'DBI' => [
        "dbi:mysql:dbname=dice_roller_test", 'root', '',
        +{
            mysql_enable_utf8 => 1,
        }
    ],

    'Redis' => [
        host => 'localhost',
        port => 6380,
    ],
};
