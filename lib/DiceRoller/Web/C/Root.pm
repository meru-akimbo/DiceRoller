package DiceRoller::Web::C::Root;
use strict;
use warnings;
use utf8;

sub index {
    my ($class, $c) = @_;
    my $counter = $c->session->get('counter') || 0;
    $counter++;
    $c->session->set('counter' => $counter);
    return $c->render('index.tx', {
        counter => $counter,
    });
};

sub reset_counter {
    my ($class, $c) = shift;
    $c->session->remove('counter');
    return $c->redirect('/');
};

sub logout {
    my ($class, $c) = @_;
    $c->session->expire();
    return $c->redirect('/');
};

1;

