<?php 

require_once 'mysqliUtils.php';
require_once 'Intersection.php';

class TimingService {
	
	/**
	 * @param int $gpslog_id
	 */
	public function findByGpslogID($gpslog_id) {

		$mysqli = newmysqli();

		$sql = array();
		$sql[] = "SELECT";
		$sql[] = "  track_id,";
		$sql[] = "  data";
		$sql[] = "FROM";
		$sql[] = "  gpslog";
		$sql[] = "WHERE";
		$sql[] = "  gpslog_id = ?";
		$sql = implode(" ", $sql);
	
		$stmt = $mysqli->prepare($sql);
		$stmt->bind_param("i", $gpslog_id);
		$stmt->execute();
		$stmt->store_result();
		$data = null;
		$stmt->bind_result($track_id, $data);
		$stmt->fetch();
		$stmt->free_result();
		$stmt->close();
		
		$sql = array();
		$sql[] = "SELECT";
		$sql[] = "  `index`,";
		$sql[] = "  `lat`,";
		$sql[] = "  `lng`,";
		$sql[] = "  `angle`";
		$sql[] = "FROM";
		$sql[] = "  `intersection`";
		$sql[] = "WHERE";
		$sql[] = "  `track_id` = ?";
		$sql[] = "ORDER BY";
		$sql[] = "  `index` asc";
		$sql = implode(" ", $sql);

		$stmt = $mysqli->prepare($sql);		
		$stmt->bind_param("i", $track_id);
		$stmt->execute();
		$intersections = getResult($stmt, "Intersection");
		$stmt->close();
		
	    $mysqli->close();
	    
	    $result = new stdClass();
	    $result->data = $data;
	    $result->intersections = $intersections;
	
	    return $result;//array("data" => $data, "intersections" => $intersections);
	}
	
	
}

?>