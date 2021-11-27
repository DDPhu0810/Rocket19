package com.vti.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.Formula;

@Entity
@Table(name = "Account", catalog = "TestingSystem_JavaAdvanced")
public class Account {

	@Id
	@Column(name = "AccountID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int accountID;

	@Column(name = "Email", nullable = false, unique = true, length = 50)
	String email;

	@Column(name = "Username", nullable = false, unique = true, length = 50)
	String userName;

	@Column(name = "FirstName", nullable = false, length = 50)
	String firstName;

	@Column(name = "LastName", nullable = false, length = 50)
	String lastName;

	@Formula("concat(FirstName, ' ', LastName")
	String fullName;

	@Column(name = "CreateDate")
	@Temporal(TemporalType.TIMESTAMP)
	@CreationTimestamp
	Date createDate;

	public Account() {
		super();
	}

	public Account(String email, String userName, String firstName, String lastName, String fullName,
			Date createDate) {
		super();
		this.email = email;
		this.userName = userName;
		this.firstName = firstName;
		this.lastName = lastName;
		this.fullName = fullName;
		this.createDate = createDate;
	}

	public int getAccountID() {
		return accountID;
	}

	public void setAccountID(int accountID) {
		this.accountID = accountID;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
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

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	@Override
	public String toString() {
		return "Account [accountID=" + accountID + ", email=" + email + ", userName=" + userName + ", firstName="
				+ firstName + ", lastName=" + lastName + ", fullName=" + fullName + ", createDate=" + createDate + "]";
	}

	
}
