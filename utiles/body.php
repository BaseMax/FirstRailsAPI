<?php
!defined("MIRESEH") ? exit() : null;

function hasParams($params=[], $need_keys=[]) {
	foreach($need_keys as $need_key) {
		if(!isset($params[$need_key])) {
			return false;
		}
	}
	return true;
}

function createAlert($has, $title=null, $message=null, $auto_hide=0) {
	if($has === 0)
		return [
			"has"=>$has,
		];
	if($auto_hide === 1)
		return [
			"has"=>$has,
			"hide"=>$auto_hide,
			"title"=>$title,
			"message"=>$message,
		];
	else
		return [
			"has"=>$has,
			"title"=>$title,
			"message"=>$message,
		];
}

function createBody($status=0, $alert=["has"=>0], $result=[]) {
	return [
		"status"=>$status,
		"alert"=>$alert,
		"result"=>$result,
	];
}

function checkParams($params=[], $need_keys=[]) {
	$res = hasParams($params, $need_keys);
	if($res === false) {
		$data = createBody(0, createAlert(1, "خطا مقادیر ارسالی", "مقادیر ارسالی معتبر نیست!", 1), []);
		return $data;
	}
	return null;
}

function checkParamsEmpty($params=[]) {
	if($params !== []) {
		$data = createBody(0, createAlert(1, "خطا مقادیر ارسالی", "مقادیر ارسالی معتبر نیست!", 1), []);
		return $data;
	}
	return null;
}

function encodeParams() {
	
}