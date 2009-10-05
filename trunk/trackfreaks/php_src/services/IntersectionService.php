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
			throwExceptionOnError($mysqli);
		}
		
		$stmt->close();
	
	    $mysqli->close();
		
	}
	
	/**
	 * @param int $track_id
	 */
	public function findByTrack($track_id) {

		$mysqli = newmysqli();

		$sql = <<<SQL
SELECT
  `index`,
  `lat`,
  `lng`,
  `angle`
FROM
  `intersection`
WHERE
  `track_id` = ?
ORDER BY
  `index` asc
SQL;

		$stmt = $mysqli->prepare($sql);		
		$stmt->bind_param("i", $track_id);
		$stmt->execute();
		$intersections = getResult($stmt, "Intersection");
		$stmt->close();

		$sql = <<<SQL
SELECT
  `data`
FROM
  `gpslog`
WHERE
  `track_id` = ?
LIMIT 0,1
SQL;
	
		$stmt = $mysqli->prepare($sql);		
		$stmt->bind_param("i", $track_id);
		$stmt->execute();
		$stmt->store_result();
		$data = null;
		$stmt->bind_result($data);
		$stmt->fetch();
		$stmt->free_result();
		$stmt->close();
		
	    $mysqli->close();
	    
	    $result = new stdClass();
	    $result->intersections = $intersections;
	    $result->data = $data;
	
	    return $result;
	}

}

?>