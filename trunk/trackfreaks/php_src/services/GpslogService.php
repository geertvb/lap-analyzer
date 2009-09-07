<?php

class GpslogService {

	// Connection information
	var $username = "trackfreaks_eu";
	var $password = "wBpjP8Ft";
	var $server = "localhost";
	var $port = "3306";
	var $databasename = "trackfreaks_eu";

	// Table information
	var $tablename = "gpslog";
	
	public function findAll() {
		$connection = mysqli_connect($this->server, $this->username, $this->password, $this->databasename, $this->port);
		$this->throwExceptionOnError($connection);
		
		$cols = array();
		$cols[] = "gpslog.gpslog_id";
		$cols[] = "gpslog.rider_id";
		$cols[] = "rider.firstname as rider_firstname";
		$cols[] = "rider.lastname as rider_lastname";
		$cols[] = "gpslog.track_id";
		$cols[] = "track.name as track_name";
		$cols[] = "gpslog.date";
		$cols[] = "gpslog.start_time";
		$cols[] = "gpslog.end_time";

		$sql = array();
		$sql[] = "SELECT";
		$sql[] = implode(", ", $cols);
		$sql[] = "FROM";
		$sql[] = $this->tablename;
		$sql[] = "LEFT OUTER JOIN";
		$sql[] = "(track, rider)";
		$sql[] = "ON";
		$sql[] = "(gpslog.track_id = track.track_id AND gpslog.rider_id = rider.rider_id)";
	
		$stmt = mysqli_prepare($connection, implode(" ", $sql));		
		$this->throwExceptionOnError($connection);
		
		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError($connection);
		
		$rows = array();
		
		mysqli_stmt_bind_result($stmt, 
			$row->gpslog_id, 
			$row->rider_id, 
			$row->rider_firstname, 
			$row->rider_lastname, 
			$row->track_id,
			$row->track_name,
			$row->date,
			$row->start_time,
			$row->end_time
			);
		
	    while (mysqli_stmt_fetch($stmt)) {
	      $rows[] = $row;
	      $row = new stdClass();
	      mysqli_stmt_bind_result($stmt,  
			$row->gpslog_id, 
			$row->rider_id, 
			$row->rider_firstname, 
			$row->rider_lastname, 
			$row->track_id,
			$row->track_name,
			$row->date,
			$row->start_time,
			$row->end_time
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
	
	public function createGpslog($rider_id, $track_id, $date, $start_time, $end_time, $data) {
		$connection = mysqli_connect($this->server, $this->username, $this->password, $this->databasename, $this->port);
		$this->throwExceptionOnError($connection);
		
		$sql = array();
		$sql[] = "INSERT INTO";
		$sql[] = $this->tablename;
		$sql[] = "(rider_id, track_id, date, start_time, end_time, data)";
		$sql[] = "VALUES";
		$sql[] = "(?, ?, ?, ?, ?, ?)";
		
		$stmt = mysqli_prepare($connection, implode(" ", $sql));		
		$this->throwExceptionOnError($connection);
		
		$content = NULL;
		
		mysqli_stmt_bind_param($stmt, "iisssb", 
			$rider_id,
			$track_id,
			$date,
			$start_time,
			$end_time,
			$content);
		
		if ($data != null) {
			$chunks = str_split($data, 4096);
			foreach ($chunks as $chunk) {
				mysqli_stmt_send_long_data($stmt, 5, $chunk);
			}
		}
		
		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError($connection);
		
		mysqli_stmt_free_result($stmt);
		
	    mysqli_close($connection);
		
	}

}

?>