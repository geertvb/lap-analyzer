<?php

require_once 'Zend/Amf/Auth/Abstract.php';

require_once 'Zend/Auth/Result.php';


class DB_Auth extends Zend_Amf_Auth_Abstract {
	
	public function authenticate() {
		if ($this->_username) {
			require_once 'services/UserService.php';
			$userService = new UserService();
			$user = $userService->findByUsername($this->_username);
			if ($user->password == $this->_password) {
				return new Zend_Auth_Result(Zend_Auth_Result::SUCCESS, $user, array());
			} else {
				return new Zend_Auth_Result(Zend_Auth_Result::FAILURE_CREDENTIAL_INVALID, null, array());
			}
		} else {
			$identity = new stdClass();
			$identity->role = 'member';
			return new Zend_Auth_Result(Zend_Auth_Result::FAILURE_IDENTITY_NOT_FOUND, null, array());
		}
	}

}

?>