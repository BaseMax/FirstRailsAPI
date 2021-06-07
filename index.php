<?php
define("MIRESEH");

require "utils/number.php";
require "utils/money.php";
require "utils/body.php";

use Mark\App;
use Workerman\Protocols\Http\Response;

require 'vendor/autoload.php';

$api = new App('http://0.0.0.0:3003');

$api->count = 4; // process count

$api->any('/', function ($request) {
    return 'Hello world!';
});

$api->get('/hello/{name}[/]', function ($request, $name) {
    // https://github.com/walkor/Workerman/blob/master/Protocols/Http.php
    print_r($request->uri());
    print_r($request->path());
    print_r($request->queryString());
    print_r($request->session());
    print_r($request->cookie());
    print_r($request->file("name"));
    print_r($request->rawHead());
    print_r($request->rawBody());

    $data = [
        "name"=>"Hello $name!",
    ];
    return new Response(200, ["Content-Type" => "application/json; charset=utf-8"], json_encode($data));
});

$api->post('/user/create', function ($request) {
    return json_encode(['code'=>0 ,'message' => 'ok']);
});

require "guest.php";

$api->start();
