<?php

$filename = $_FILES["file"]["name"];
$mimetype = $_FILES["file"]["type"];
$size = $_FILES["file"]["size"];
$image_file = $_FILES["file"]["tmp_name"];
$content = NULL;

//TODO Validation:
// type: Only jpeg files (check extension and mimetype)
// size: Smaller than 2MB
// is uploaded file?

$mysqli = new mysqli("localhost", "trackfreaks_eu", "wBpjP8Ft", "trackfreaks_eu");

$sql = <<<SQL
INSERT INTO picture (
	`filename`,
	`mimetype`,
	`size`,
	`width`,
	`height`,
	`content`
) VALUES (
	?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?
)
SQL;

$stmt = $mysqli->prepare($sql);

$stmt->bind_param(
	'ssiiib', 
	$filename, 
	$mimetype, 
	$size, 
	$width, 
	$height, 
	$content);

$fp = fopen($image_file, "r");
while (!feof($fp)) {
	$stmt->send_long_data(5, fread($fp, 4096));
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