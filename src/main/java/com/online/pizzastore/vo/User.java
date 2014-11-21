package com.online.pizzastore.vo;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "user")
public class User implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -1565279967021999406L;

	@Column(name = "USER_ID")
	private String userid;
	
	@Column(name = "PASSWORD")
	private String password;	
	
	@Column(name = "FIRST_NAME")
	private String firstName;
	
	@Column(name = "LAST_NAME")
	private String lastName;
	
	@Column(name = "STATUS")
	private String status;
	
	@Id
	@Column(name = "EMAIL_ID", unique = true, nullable = false)
	private String emailid;
	
	@Column(name = "USER_TOKEN",unique=true)
	private String userToken;
	
	@Column(name = "TOKEN_EXPIRY_DATE")
	private String tokenExpiryDate;
	
	@Column(name = "CREATED_DATE")
	private String createdDate;
	
	@Column(name = "LAST_MODIFIED_DATE")
	private String lastModifieddDate;
	
	@OneToOne(mappedBy = "user", cascade = CascadeType.ALL) 
	private Address address;

	public String toString(){
		StringBuffer sb = new StringBuffer();
		sb.append("\n<User>\n")
		.append("\t<Password>").append(password).append("</Password>\n")
		.append("\t<FirstName>").append(firstName).append("</FirstName>\n")
		.append("\t<Status>").append(status).append("</Status>\n")
		.append("</User>");
		
		return sb.toString();
	}
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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}
	
}
