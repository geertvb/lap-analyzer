<?php

require_once 'Trackday.php';
require_once 'TrackdayRow.php';

class TrackdayService {

	// Connection information
	var $username = "trackfreaks_eu";
	var $password = "wBpjP8Ft";
	var $server = "localhost";
	var $port = "3306";
	var $databasename = "trackfreaks_eu";

	// Table information
	var $tablename = "organization";
	
	/**
	 * @return Trackday 
	 *
	 */
	public function getTrackday() {
		return new Trackday();
	}
		
	/**
	 * @return TrackdayRow
	 *
	 */
	public function getTrackdayRow() {
		return new TrackdayRow();
	}
		
	public function findAllRows() {
		$connection = mysqli_connect($this->server, $this->username, $this->password, $this->databasename, $this->port);
		$this->throwExceptionOnError($connection);
		
		$sql = <<<SQL
SELECT
  trackday.trackday_id,
  trackday.track_id,
  trackday.organization_id,
  trackday.date,
  track.name as trackname,
  organization.name as organizationname 
FROM
  trackday
LEFT OUTER JOIN
  (track, organization)
ON
  (trackday.track_id = track.track_id AND trackday.organization_id = organization.organization_id)
ORDER BY
  date ASC
SQL;
	
		$stmt = mysqli_prepare($connection, $sql);		
		$this->throwExceptionOnError($connection);
		
		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError($connection);
		
		$rows = array();
		
		mysqli_stmt_bind_result($stmt, 
			$row->trackday_id, 
			$row->track_id, 
			$row->organization_id,
			$row->date, 
			$row->trackname, 
			$row->organizationname
			);
		
	    while (mysqli_stmt_fetch($stmt)) {
	      $rows[] = $row;
	      $row = new stdClass();
	      mysqli_stmt_bind_result($stmt, 
			$row->trackday_id, 
			$row->track_id, 
			$row->organization_id,
			$row->date, 
			$row->trackname, 
			$row->organizationname
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
