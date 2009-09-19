<?php

require_once 'Intersection.php';

class IntersectionService {

	// Connection information
	var $username = "trackfreaks_eu";
	var $password = "wBpjP8Ft";
	var $server = "localhost";
	var $port = "3306";
	var $databasename = "trackfreaks_eu";

	// Table information
	var $tablename = "intersection";
	
	/**
	 * 
	 * @param $track_id int
	 * @return Intersection
	 */
	public function findByTrack($track_id) {
		$connection = mysqli_connect($this->server, $this->username, $this->password, $this->databasename, $this->port);
		$this->throwExceptionOnError($connection);
		
		$cols = array();
		$cols[] = "intersection_id";
		$cols[] = "track_id";
		$cols[] = "`index`";
		$cols[] = "lat";
		$cols[] = "lng";
		$cols[] = "angle";

		$sql = array();
		$sql[] = "SELECT";
		$sql[] = implode(", ", $cols);
		$sql[] = "FROM";
		$sql[] = $this->tablename;
		$sql[] = "WHERE";
		$sql[] = "track_id = ?";
		$sql[] = "ORDER BY";
		$sql[] = "`index` asc";
	
		$stmt = mysqli_prepare($connection, implode(" ", $sql));		
		$this->throwExceptionOnError($connection);
		
		mysqli_stmt_bind_param($stmt, "i", $track_id); 
		
		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError($connection);
		
		$rows = array();
		
		mysqli_stmt_bind_result($stmt, 
			$row->intersection_id, 
			$row->track_id, 
			$row->index,
			$row->lat,
			$row->lng,
			$row->angle
			);
		
	    while (mysqli_stmt_fetch($stmt)) {
	      $rows[] = $row;
	      $row = new stdClass();
	      mysqli_stmt_bind_result($stmt,  
			$row->intersection_id, 
			$row->track_id, 
			$row->index,
			$row->lat,
			$row->lng,
			$row->angle
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