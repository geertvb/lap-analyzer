<?php

require_once 'Rider.php';
require_once 'mysqliUtils.php';

class RiderService {

	// Connection information
	var $username = "trackfreaks_eu";
	var $password = "wBpjP8Ft";
	var $server = "localhost";
	var $port = "3306";
	var $databasename = "trackfreaks_eu";

	// Table information
	var $tablename = "rider";
	
	/**
	 * 
	 * @param int $rider_id 
	 * @return Rider
	 *
	 */
	public function findByID($rider_id) {
		
	}
	
	/**
	 * 
	 * @return array
	 */
	public function findAll() {
		$connection = mysqli_connect($this->server, $this->username, $this->password, $this->databasename, $this->port);
		$this->throwExceptionOnError($connection);
		
		$sql = <<<SQL
SELECT
  `rider`.`rider_id`,
  `rider`.`firstname`,
  `rider`.`lastname`,
  `rider`.`picture_id`
FROM
  `rider`
ORDER BY
  `firstname` asc,
  `lastname` asc
SQL;
	
		$stmt = mysqli_prepare($connection, $sql);		
		$this->throwExceptionOnError($connection);
		
		mysqli_stmt_execute($stmt);
		$this->throwExceptionOnError($connection);
		
		$rows = array();
		
		$row = new Rider();
		mysqli_stmt_bind_result($stmt, 
			$row->rider_id, 
			$row->firstname, 
			$row->lastname,
			$row->picture_id
			);
		
	    while (mysqli_stmt_fetch($stmt)) {
	      $rows[] = $row;
	      $row = new Rider();
	      mysqli_stmt_bind_result($stmt,  
			$row->rider_id,
			$row->firstname,
			$row->lastname,
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

	/**
	 * 
	 * @param string $username
	 * @return Rider
	 */
	public function findByUsername($username) {
				
		$sql = <<<SQL
SELECT
  rider.rider_id,
  rider.username,
  rider.password,
  rider.role,
  rider.firstname,
  rider.lastname,
  rider.email 
FROM
  rider
WHERE
  rider.username = ?
SQL;

		$mysqli = newMysqli();
		
		if ($stmt = $mysqli->prepare($sql)) {
			$stmt->bind_param("s", $username);
			mysqli_stmt_execute($stmt);	
			$result = getSingleResult($stmt, "Rider");
			$stmt->close();
		} else {
			throwExceptionOnError($mysqli);
		}
		
		$mysqli->close();
		
		return $result;
	}
	
}

?>