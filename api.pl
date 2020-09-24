#!/usr/bin/env perl
use Mojolicious::Lite -signatures;
use Mojo::JSON qw(decode_json false true);
use File::Slurp qw(read_file);

my $filename = "./db.json";

my $json = read_file($filename);
my $jsonStructure = decode_json($json);



get '/' => sub ($c) {
  $c->res->headers->header("Access-Control-Allow-Origin" => "*");
  $c->res->headers->access_control_allow_origin("*");
  $c->res->headers->header("Access-Control-Allow-Methods" => "GET, OPTIONS, POST, DELETE, PUT");
  $c->res->headers->header("Access-Control-Allow-Headers" => "Content-Type" => "application/x-www-form-urlencoded");
  $c->render(json => $jsonStructure);
};

app->start;
__DATA__


