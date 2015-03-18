package t::Util;
BEGIN {
    unless ($ENV{PLACK_ENV}) {
        $ENV{PLACK_ENV} = 'test';
    }
    if ($ENV{PLACK_ENV} eq 'production') {
        die "Do not run a test script on deployment environment";
    }
}
use File::Spec;
use File::Basename;
use lib File::Spec->rel2abs(File::Spec->catdir(dirname(__FILE__), '..', 'lib'));
use parent qw/Exporter/;
use Test::More 0.98;

use DiceRoller;
use DBI;

our @EXPORT = qw(
    slurp
    c
    setup_db
);

{
    # utf8 hack.
    binmode Test::More->builder->$_, ":utf8" for qw/output failure_output todo_output/;
    no warnings 'redefine';
    my $code = \&Test::Builder::child;
    *Test::Builder::child = sub {
        my $builder = $code->(@_);
        binmode $builder->output,         ":utf8";
        binmode $builder->failure_output, ":utf8";
        binmode $builder->todo_output,    ":utf8";
        return $builder;
    };
}

sub c { DiceRoller->bootstrap }

sub slurp {
    my $fname = shift;
    open my $fh, '<:encoding(UTF-8)', $fname or die "$fname: $!";
    scalar do { local $/; <$fh> };
}

sub setup_db {
    my $conf = c->config->{DBI};

    my $dbh = DBI->connect(@$conf);
    my ($dbname) = $conf->[0] =~ /mysql:(?:dbname=)?([^;]+)/;
    $dbh->do(sprintf(q{ DROP DATABASE IF EXISTS `%s`}, $dbname));
    $dbh->do(sprintf(q{ CREATE DATABASE `%s`}, $dbname));
    $dbh->do(sprintf(q{ USE `%s`}, $dbname));
    $dbh->do(sprintf(q{ SET NAMES utf8 }, $dbname));

    system("mysql -u$conf->[1] $dbname < sql/mysql.sql");
}

setup_db;

1;
