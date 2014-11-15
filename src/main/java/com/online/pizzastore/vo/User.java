package com.online.pizzastore.vo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "user")
public class User {
	
	@Column(name = "USER_ID")
	private String userid;
	
	@Column(name = "FIRST_NAME")
	private String firstName;
	
	@Column(name = "LAST_NAME")
	private String lastName;
	
	@Column(name = "STATUS")
	private String status;
	
	@Id
	@Column(name = "EMAIL_ID")
	private String emailid;
	
	@Column(name = "USER_TOKEN")
	private String userToken;
	
	@Column(name = "TOKEN_EXPIRY_DATE")
	private String tokenExpiryDate;
	
	@Column(name = "CREATED_DATE")
	private String createdDate;
	
	@Column(name = "LAST_MODIFIED_DATE")
	private String lastModifieddDate;

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getEmailid() {
		return emailid;
	}

	public void setEmailid(String emailid) {
		this.emailid = emailid;
	}

	public String getUserToken() {
		return userToken;
	}

	public void setUserToken(String userToken) {
		this.userToken = userToken;
	}

	public String getTokenExpiryDate() {
		return tokenExpiryDate;
	}

	public void setTokenExpiryDate(String tokenExpiryDate) {
		this.tokenExpiryDate = tokenExpiryDate;
	}

	public String getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}

	public String getLastModifieddDate() {
		return lastModifieddDate;
	}

	public void setLastModifieddDate(String lastModifieddDate) {
		this.lastModifieddDate = lastModifieddDate;
	}
	
}
