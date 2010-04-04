<?php

require_once 'Organization.php';

class OrganizationService {
	
	// Connection information
	var $username = "trackfreaks_eu";
	var $password = "wBpjP8Ft";
	var $server = "localhost";
	var $port = "3306";
	var $databasename = "trackfreaks_eu";

	// Table information
	var $tablename = "organization";
	
	/**
	 * @return Organization 
	 *
	 */
	public function getOrganization() {
		return new Organization();
	}
		
	public function findAll() {
		$connection = mysqli_connect($this->server, $this->username, $this->password, $this->databasename, $this->port);
		$this->throwExceptionOnError($connection);
		
		$cols = array();
		$cols[] = "organization_id";
		$cols[] = "name";
		$cols[] = "url";

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
			$row->organization_id, 
			$row->name, 
			$row->url);
		
	    while (mysqli_stmt_fetch($stmt)) {
	      $rows[] = $row;
	      $row = new stdClass();
	      mysqli_stmt_bind_result($stmt,  
			$row->organization_id,
			$row->name,
			$row->url
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