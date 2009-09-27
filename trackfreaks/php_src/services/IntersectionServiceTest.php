<?php

require_once 'IntersectionService.php';

$service = new IntersectionService();

$result = $service->findByTrack(1);

var_dump($result);

?>