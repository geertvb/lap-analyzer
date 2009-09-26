<?php

require_once 'Intersection.php';
require_once 'mysqliUtils.php';

class IntersectionService {
	
	/**
	 * @return Intersection
	 */
	public function getIntersection() {
		
	}

	/**
	 * @param int $track_id
	 * @param array $intersections
	 * @return void
	 */
	public function updateByTrack($track_id, $intersections) {
		
		$mysqli = newMysqli();
		
		// Delete old intersections
		
		$sql = array();

		$sql[] = "DELETE";
		$sql[] = "FROM";
		$sql[] = "  `intersection`";
		$sql[] = "WHERE";
		$sql[] = "  `track_id` = ?";
		
		$stmt = $mysqli->prepare(implode(" ", $sql));
		throwExceptionOnError($mysqli);
		$stmt->bind_param("i", $track_id);
		$stmt->execute();
		$stmt->close();
				
		// Create new intersections
		
		$sql = array();

		$sql[] = "INSERT INTO intersection";
		$sql[] = "  (track_id, `index`, lat, lng, angle)";
		$sql[] = "VALUES";
		$sql[] = "  (?,?,?,?,?)";
		
		$stmt = $mysqli->prepare(implode(" ", $sql));		
		throwExceptionOnError($mysqli);

		foreach ($intersections as $index => $intersection) {
			$stmt->bind_param("iiddd", 
				$track_id,
				$index,
				$intersection->lat,
				$intersection->lng,
				$intersection->angle);
			
			$stmt->execute();
			throwExceptionOnError($connection);
		}
		
		$stmt->close();
	
	    $mysqli->close();
		
	}
	
	/**
	 * @param int $track_id
	 * @return array of Intersection
	 */
	public function findByTrack($track_id) {
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

		$mysqli = newmysqli();

		$stmt = $mysqli->prepare(implode(" ", $sql));		
		throwExceptionOnError($mysqli);

		$stmt->bind_param("i", $track_id);

		$stmt->execute();
		throwExceptionOnError($mysqli);
		
		$result = getResult($stmt, "Intersection");
		
	    $mysqli->close();
	
	    return $result;
	}

}

?>