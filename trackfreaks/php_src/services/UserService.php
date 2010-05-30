<?php

require_once 'User.php';
require_once 'mysqliUtils.php';

class UserService {

	/**
	 * 
	 * @param string $username
	 * @return User
	 */
	public function findByUsername($username) {
				
		$sql = <<<SQL
SELECT
  user.user_id,
  user.username,
  user.password,
  user.role 
FROM
  user
WHERE
  user.username = ?
SQL;

		$mysqli = newMysqli();
		
		$stmt = mysqli_prepare($mysqli, $sql);
		$stmt->bind_param("s", $username);
		mysqli_stmt_execute($stmt);	
		$result = getSingleResult($stmt, "User");
		$stmt->close();
		
		$mysqli->close();
		
		return $result;
	}
	
}
	
?>