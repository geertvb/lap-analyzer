<?php

require_once 'GpslogService.php';

$s = new GpslogService();

$rows = $s->findAll();

var_dump($rows)

?>