<?php

class TrackService {

	// Connection information
	var $username = "trackfreaks_eu";
	var $password = "wBpjP8Ft";
	var $server = "localhost";
	var $port = "3306";
	var $databasename = "trackfreaks_eu";

	// Table information
	var $tablename = "track";
	
	public function findAll() {
		$connection = mysqli_connect($this->server, $this->username, $this->password, $this->databasename, $this->port);
		$this->throwExceptionOnError($connection);
		
		$cols = array();
		$cols[] = "track_id";
		$cols[] = "name";
		$cols[] = "url";
		$cols[] = "lat";
		$cols[] = "lng";
		$cols[] = "country";
		$cols[] = "length";
		$cols[] = "picture_id";

		$sql = array();
		$sql[] = "SELECT";
		$sql[] = implode(", ", $cols);
		$sql[] = "FROM";
		$sql[] = $this->tablename;
		$sql[] = "ORDER BY";
		$sql[] = "name asc";
	
		$stmt = mysqli_prepare($connection, implode(" ", $sql));		
		$this->throwExceptionOnError($connection);
		
		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError($connection);
		
		$rows = array();
		
		mysqli_stmt_bind_result($stmt, 
			$row->track_id, 
			$row->name, 
			$row->url, 
			$row->lat, 
			$row->lng,
			$row->country,
			$row->length,
			$row->picture_id);
		
	    while (mysqli_stmt_fetch($stmt)) {
	      $rows[] = $row;
	      $row = new stdClass();
	      mysqli_stmt_bind_result($stmt,  
			$row->track_id,
			$row->name,
			$row->url,
			$row->lat,
			$row->lng,
			$row->country,
			$row->length,
			$row->picture_id
			);
	    }
		
		mysqli_stmt_free_result($stmt);
		
	    mysqli_close($connection);
	
	    return $rows;
	}

	private function throwExceptionOnError($link) {
		if(mysqli_error($link)) {
			$msg = mysqli_errno($link) . ": " . mysqli_error($link);
			throw new Exception('MySQL Error - '. $msg);
		}		
	}

}

?>