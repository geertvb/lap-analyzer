<?php

require_once 'Zend/Amf/Auth/Abstract.php';

require_once 'Zend/Auth/Result.php';


class DB_Auth extends Zend_Amf_Auth_Abstract {
	
	public function authenticate() {
		if ($this->_username) {
			require_once 'services/RiderService.php';
			$riderService = new RiderService();
			$rider = $riderService->findByUsername($this->_username);
			if ($rider != null) {
				if ($rider->password == $this->_password) {
					return new Zend_Auth_Result(Zend_Auth_Result::SUCCESS, $rider, array("Login successful"));
				} else {
					return new Zend_Auth_Result(Zend_Auth_Result::FAILURE_CREDENTIAL_INVALID, null, array("Invalid password"));
				}
			} else {
				return new Zend_Auth_Result(Zend_Auth_Result::FAILURE_IDENTITY_NOT_FOUND, null, array("Unknown username"));
			}
		} else {
			return new Zend_Auth_Result(Zend_Auth_Result::FAILURE, null, array("Username not supplied"));
		}
	}

}

?>