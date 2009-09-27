<?php

require_once 'TimingService.php';

$service = new TimingService();

$result = $service->findByGpslogID(47);

var_dump($result);

?>