package com.online.pizzastore.vo;

public enum UserStatus {
	EMAIL_REGISTERED("ER"), EMAIL_VERIFIED("EV"), PASSWORD_CREATED("PC"), ADDRESS_CREATED("AC"), FORGET_PASSWORD("AC");
	
	private String statusCode;
	 
	private UserStatus(String s) {
		statusCode = s;
	}
 
	public String getStatusCode() {
		return statusCode;
	}

	public static UserStatus fromInteger(int x) {
		switch (x) {
		case 0:
			return EMAIL_REGISTERED;
		case 1:
			return EMAIL_VERIFIED;
		case 2:
			return PASSWORD_CREATED;
		case 3:
			return ADDRESS_CREATED;
		case 4:
			return FORGET_PASSWORD;
		default:
			return null;

		}

	}

}