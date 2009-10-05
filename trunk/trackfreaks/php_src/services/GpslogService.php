<?php

require_once 'Gpslog.php';
require_once 'mysqliUtils.php';

class GpslogService {
	
	/**
	 * @return Gpslog 
	 *
	 */
	public function getGpslog() {
		return new Gpslog();
	}

	/**
	 * @return array of Gpslog
	 */
	public function findAll() {
		$sql = array();

		$sql[] = "SELECT";
		$sql[] = "  gpslog.gpslog_id,";
		$sql[] = "  gpslog.rider_id,";
		$sql[] = "  rider.firstname as rider_firstname,";
		$sql[] = "  rider.lastname as rider_lastname,";
		$sql[] = "  gpslog.track_id,";
		$sql[] = "  track.name as track_name,";
		$sql[] = "  gpslog.date,";
		$sql[] = "  gpslog.start_time,";
		$sql[] = "  gpslog.end_time";
		$sql[] = "FROM";
		$sql[] = "  gpslog";
		$sql[] = "LEFT OUTER JOIN";
		$sql[] = "  (track, rider)";
		$sql[] = "ON";
		$sql[] = "  (gpslog.track_id = track.track_id AND gpslog.rider_id = rider.rider_id)";
		
	    return findSQL(null, implode(" ", $sql), "Gpslog");
	}

	/**
	 * @param int $rider_id
	 * @param int $track_id
	 * @param string $date
	 * @param string $start_time
	 * @param string $end_time
	 * @param string $data
	 * @return void
	 */
	public function createGpslog($rider_id, $track_id, $date, $start_time, $end_time, $data) {
		$mysqli = newmysqli();
		
		$sql = array();
		$sql[] = "INSERT INTO gpslog";
		$sql[] = "  (rider_id, track_id, date, start_time, end_time, data)";
		$sql[] = "VALUES";
		$sql[] = "  (?, ?, ?, ?, ?, ?)";
		
		$stmt = $mysqli->prepare(implode(" ", $sql));		
		throwExceptionOnError($mysqli);
		
		$content = NULL;
		
		$stmt->bind_param("iisssb", 
			$rider_id,
			$track_id,
			$date,
			$start_time,
			$end_time,
			$content);
		
		if ($data != null) {
			$chunks = str_split($data, 4096);
			foreach ($chunks as $chunk) {
				$stmt->send_long_data(5, $chunk);
			}
		}
		
		$stmt->execute();
		throwExceptionOnError($mysqli);
		
		$stmt->free_result();
		
	    $mysqli->close();
	}
	
	public function findAllDates() {
		$sql = array();
		
		$sql[] = "SELECT DISTINCT";
		$sql[] = "  date";
		$sql[] = "FROM";
		$sql[] = "  gpslog";
		$sql[] = "ORDER BY";
		$sql[] = "  date ASC";
		
	    return findValues(null, implode(" ", $sql));
	}

	/**
	 * @param int
	 * @return string
	 */
	public function findSampleTrackData($track_id) {
		$sql = array();
		
		$sql[] = "SELECT";
		$sql[] = "  data";
		$sql[] = "FROM";
		$sql[] = "  gpslog";
		$sql[] = "WHERE";
		$sql[] = "  track_id = ?";
		$sql[] = "LIMIT 0,1";
	
		$mysqli = newmysqli();

		$stmt = $mysqli->prepare(implode(" ", $sql));		
		throwExceptionOnError($mysqli);

		$stmt->bind_param("i", $track_id);

		$stmt->execute();
		throwExceptionOnError($mysqli);
		
		$stmt->store_result();
		$content = null;
		$stmt->bind_result($content);
		$stmt->fetch();
		$stmt->free_result();
		
	    $mysqli->close();
	
	    return $content;
	}

}

?>