package DiceRoller;
use strict;
use warnings;
use utf8;
our $VERSION='0.01';
use 5.008001;
use DiceRoller::DB::Schema;
use DiceRoller::DB;

use DataTimeX::Factory;

use parent qw/Amon2/;
# Enable project local mode.
__PACKAGE__->make_local_context();
__PACKAGE__->load_plugin('Redis');

my $schema = DiceRoller::DB::Schema->instance;

sub db {
    my $c = shift;
    if (!exists $c->{db}) {
        my $conf = $c->config->{DBI}
            or die "Missing configuration about DBI";
        $c->{db} = DiceRoller::DB->new(
            schema       => $schema,
            connect_info => [@$conf],
            # I suggest to enable following lines if you are using mysql.
            # on_connect_do => [
            #     'SET SESSION sql_mode=STRICT_TRANS_TABLES;',
            # ],
        );
    }
    $c->{db};
}

sub dt {
    my $c = shift;

    DateTimeX::Factory->new(
        time_zone => $c->config->{TIME_ZONE},
    );
}

sub now {
    my $c = shift;
    $c->dt->now
}

sub today {
    my $c = shift;
    $c->dt->today
}

sub yesterday {
    my $c = shift;
    $c->dt->yesterday
}


1;
__END__

=head1 NAME

DiceRoller - DiceRoller

=head1 DESCRIPTION

This is a main context class for DiceRoller

=head1 AUTHOR

DiceRoller authors.

