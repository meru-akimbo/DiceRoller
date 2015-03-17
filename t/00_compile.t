use strict;
use warnings;
use Test::More;


use DiceRoller;
use DiceRoller::Web;
use DiceRoller::Web::View;
use DiceRoller::Web::ViewFunctions;

use DiceRoller::DB::Schema;
use DiceRoller::Web::Dispatcher;


pass "All modules can load.";

done_testing;
