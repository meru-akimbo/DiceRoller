package DiceRoller::Web::Dispatcher;
use strict;
use warnings;
use utf8;
use Amon2::Web::Dispatcher::RouterBoom;
use Module::Find ();
use Try::Tiny;

Module::Find::useall("DiceRoller::Web::C");

base 'DiceRoller::Web::C';

any '/'                => 'Root#index';
post '/reset_counter'  => 'Root#register';
post '/account/logout' => 'Root#logout';

1;
