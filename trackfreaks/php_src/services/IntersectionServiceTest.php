<?php

require_once 'IntersectionService.php';

$s = new IntersectionService();

$rows = $s->findByTrack(1);

var_dump($rows)

?>