<?php

include 'resizeimage.php';

$filename = $_FILES["file"]["name"];
$mimetype = $_FILES["file"]["type"];
$size = $_FILES["file"]["size"];
$image_file = $_FILES["file"]["tmp_name"];

$content = NULL;
$thumb_content = NULL;

$thumb_file = tempnam(sys_get_temp_dir(), 'thumb');

list($thumb_width, $thumb_height, $width, $height) = createthumb($image_file, $thumb_file);

$thumb_mimetype = "image/jpeg";
$thumb_size = filesize($thumb_file);

$mysqli = new mysqli("localhost", "trackfreaks_eu", "wBpjP8Ft", "trackfreaks_eu");

$sql = "INSERT INTO picture (";
$sql .= "`filename`,";
$sql .= "`mimetype`,";
$sql .= "`size`,";
$sql .= "`width`,";
$sql .= "`height`,";
$sql .= "`content`,";
$sql .= "`thumb_mimetype`,";
$sql .= "`thumb_size`,";
$sql .= "`thumb_width`,";
$sql .= "`thumb_height`,";
$sql .= "`thumb_content`";
$sql .= ") VALUES ";
$sql .= "(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

$stmt = $mysqli->prepare($sql);

$stmt->bind_param('ssiiibsiiib', $filename, $mimetype, $size, $width, $height, $content, $thumb_mimetype, $thumb_size, $thumb_width, $thumb_height, $thumb_content);

$fp = fopen($image_file, "r");
while (!feof($fp)) {
	$stmt->send_long_data(5, fread($fp, 4096));
}
fclose($fp);

$fp = fopen($thumb_file, "r");
while (!feof($fp)) {
	$stmt->send_long_data(10, fread($fp, 4096));
}
fclose($fp);

$stmt->execute();

$stmt->close();

// Get picture_id

if ($result = $mysqli->query("SELECT LAST_INSERT_ID()")) {
	list($picture_id) = $result->fetch_row();
	$result->close();
}

$mysqli->close();

unlink($thumb_file);

$xml = new XMLWriter();
$xml->openMemory();
$xml->setIndent(true);
$xml->setIndentString(' ');
$xml->startDocument('1.0', 'UTF-8');
$xml->startElement("picture");

	$xml->writeElement('picture_id', $picture_id);
	$xml->writeElement('filename', $filename);
	$xml->writeElement('mimetype', $mimetype);
	$xml->writeElement('width', $width);
	$xml->writeElement('height', $height);
	$xml->writeElement('size', $size);
	
$xml->endElement();
$xml->endDocument();

echo $xml->outputMemory();

?>