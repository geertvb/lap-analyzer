<?php
	
$picture_id = $_GET["picture_id"];

$mysqli = new mysqli("localhost", "trackfreaks_eu", "wBpjP8Ft", "trackfreaks_eu");
if ($mysqli) {

	$sql = "SELECT `filename`, `mimetype`, `size` FROM `picture` WHERE `picture_id` = ?";
	if ($stmt = $mysqli->prepare($sql)) {
		$stmt->bind_param('i', $picture_id);
		if ($stmt->execute()) {
			$stmt->bind_result($filename, $mimetype, $size);
			$result = $stmt->fetch();
		}
		$stmt->close();
	}
	
	$sql = "SELECT `content` FROM `picture` WHERE `picture_id` = ?";
	if ($stmt = $mysqli->prepare($sql)) {
		$stmt->bind_param('i', $picture_id);
		if ($stmt->execute()) {
			$stmt->store_result();
			$content = null;
			$stmt->bind_result($content);
			$result = $stmt->fetch();
		}
		$stmt->close();
	}
	
	$mysqli->close();
	
    $file_extension = strtolower(substr(strrchr($filename,"."),1));

    switch ($file_extension) {
        case "gif": 
        	$ctype="image/gif"; 
        	break;
        case "png": 
        	$ctype="image/png"; 
        	break;
        case "jpe": 
        case "jpeg":
        case "jpg": 
        	$ctype="image/jpg"; 
        	break;
        default: 
        	$ctype="application/force-download";
    }

	header("Content-type: $ctype");
	header("Content-length: $size");
	header("Content-Disposition: inline; filename=$filename");
	header("Content-Description: PHP Generated Data");
	
	print $content;
	
}

?>