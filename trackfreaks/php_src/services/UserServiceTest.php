<?php

require_once 'UserService.php';

$s = new UserService();

$rows = $s->findByUsername('Geert');

var_dump($rows);

?>