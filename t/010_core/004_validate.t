use strict;
use warnings;
use Test::More tests => 3;
use Test::Exception;
use HTTP::Session;
use HTTP::Session::State::Null;
use HTTP::Session::Store::Null;
use HTTP::Response;
use CGI;

sub {
    my $session = HTTP::Session->new(
        state => HTTP::Session::State::Null->new,
        store => HTTP::Session::Store::Null->new,
        request => CGI->new(),
    );
    my $res = HTTP::Response->new;
    dies_ok { $session->response_filter };
    dies_ok { $session->response_filter($res) };
    $session->session_id('hoge');
    lives_ok { $session->response_filter($res) };
}->();
