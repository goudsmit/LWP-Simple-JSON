package LWP::Simple::JSON;
use strict;
use warnings;

use JSON qw(decode_json);
use LWP::UserAgent;
use HTTP::Request;

use parent 'Exporter';
our @EXPORT_OK = qw(get_json);

sub get_json {
    my $uri = shift;
    my $request = HTTP::Request->new('GET', $uri);
    $request->header('Accept'=>'application/json, text/json');
    my $lwp = LWP::UserAgent->new;
    my $response = $lwp->request($request);
    return unless $response->is_success;
    return decode_json($response->decoded_content);
}

1;
