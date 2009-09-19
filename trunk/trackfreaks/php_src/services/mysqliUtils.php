<?php

/**
 * @return MySQLi
 */
function newMysqli() {
	$mysqli = new mysqli("localhost", "trackfreaks_eu", "wBpjP8Ft", "trackfreaks_eu", 3306);
	
	if ($mysqli->connect_errno) {
		$msg = $mysqli->connect_errno . ": " . $mysqli->connect_error;
		throw new Exception('MySQL Error - '. $msg);
	}		
		
	return $mysqli;
}

function throwExceptionOnError($mysqli) {
	if ($mysqli->error) {
		$msg = $mysqli->errno . ": " . $mysqli->error;
		throw new Exception('MySQL Error - '. $msg);
	}		
}
	
function findSQL($mysqli = NULL, $sql, $classname = "stdClass") {
	
	if (is_null($mysqli)) {
		$mysqli = newMysqli();
		$created = true;
	}
	
	if ($stmt = $mysqli->prepare($sql)) {
		if ($stmt->execute()) {
			$result = getresult($stmt, $classname);
		} else {
			throwExceptionOnError($mysqli);
		}
		$stmt->close();
	} else {
		throwExceptionOnError($mysqli);
	}
	
	if ($created) {
		$mysqli->close();
	}
	
	return $result;
}

function getResult($stmt, $classname = "stdClass") {
	$result = array();
	 
	$metadata = $stmt->result_metadata();
	$fields = $metadata->fetch_fields();

	for (;;) {
		$pointers = array();
		$row = new $classname;
		 
		$pointers[] = $stmt;
		foreach ($fields as $field) {
			$fieldname = $field->name;
			$pointers[] = &$row->$fieldname;
		}
		 
		call_user_func_array(mysqli_stmt_bind_result, $pointers);
		 
		if (!$stmt->fetch()) {
			break;
		}
		 
		$result[] = $row;
	}
	 
	$metadata->free();
	 
	return $result;
}

function getSingleResult($stmt, $classname = "stdClass") {
	$metadata = $stmt->result_metadata();
	$fields = $metadata->fetch_fields();

	$pointers = array();
	$result = new $classname;
	 
	$pointers[] = $stmt;
	foreach ($fields as $field) {
		$fieldname = $field->name;
		$pointers[] = &$result->$fieldname;
	}
	 
	call_user_func_array(mysqli_stmt_bind_result, $pointers);
	 
	if (!$stmt->fetch()) {
		$result = null;
	}

	$metadata->free();
	 
	return $result;
}

function findValues($mysqli = NULL, $sql) {
	
	if (is_null($mysqli)) {
		$mysqli = newMysqli();
		$created = true;
	}
	
	if ($stmt = $mysqli->prepare($sql)) {
		if ($stmt->execute()) {
			$result = getValues($stmt);
		} else {
			throwExceptionOnError($mysqli);
		}
		$stmt->close();
	} else {
		throwExceptionOnError($mysqli);
	}
	
	if ($created) {
		$mysqli->close();
	}
	
	return $result;
}

function getValues($stmt) {
	$result = array();
	
	for (;;) {
		$value = null;
		$stmt->bind_result($value);
		if (!$stmt->fetch()) {
			break;
		}
		$result[] = $value;
	}
	
	return $result;
}

?>