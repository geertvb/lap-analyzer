<?php

require_once 'TrackService.php';

$ts = new TrackService();

$rows = $ts->findAll();

var_dump($rows)

?>