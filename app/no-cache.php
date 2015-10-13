<?php 

header('Content-Type: application/json');

$api_response = [
	'origin_server' => gethostname(),
	'key_int' => 38393,
	'key_string' => 'goodbye'
];

echo json_encode($api_response);