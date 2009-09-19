<?php

require_once 'Intersection.php';
require_once 'mysqliUtils.php';

class IntersectionService {

	/**
	 * @param $track_id int
	 * @return Intersection
	 */
	public function findByTrack($track_id) {
		$sql = array();

		$sql[] = "SELECT";
		$sql[] = "  `intersection_id`,";
		$sql[] = "  `track_id`,";
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