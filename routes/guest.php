<?php
!defined("MIRESEH") ? exit() : null;

$api->get('/v2/guest[/]', function ($request) {
	$params = encodeParams($request->rawBody());
	checkParamsEmpty($params);
}
