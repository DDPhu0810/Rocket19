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

@Entity
@Table(name = "Group", catalog = "TestingSystem_JavaAdvanced")
public class Group {
	@Id
	@Column(name = "GroupID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int groupId;

	@Column(name = "GroupName", nullable = false, unique = true, length = 50)
	String groupName;

	@Column(name = "CreateDate")
	@Temporal(TemporalType.TIMESTAMP)
	@CreationTimestamp
	Date createDate;

	public Group() {
		super();
	}

	public Group(String groupName) {
		super();
		this.groupName = groupName;
	}

	public Group(String groupName, Date createDate) {
		super();
		this.groupName = groupName;
		this.createDate = createDate;
	}

	public Group(int groupId, String groupName) {
		super();
		this.groupId = groupId;
		this.groupName = groupName;
	}

	public Group(int groupId, String groupName, Date createDate) {
		super();
		this.groupId = groupId;
		this.groupName = groupName;
		this.createDate = createDate;
	}

	public int getGroupId() {
		return groupId;
	}

	public void setGroupId(int groupId) {
		this.groupId = groupId;
	}

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	@Override
	public String toString() {
		return "Group [groupId=" + groupId + ", groupName=" + groupName + ", createDate=" + createDate + "]";
	}

	public void printfForm() {
		System.out.printf("%10s|%20s|%30s", "GroupID", "GroupName", "CreateDate\n");
	}

	public void printfGroup() {
		System.out.printf("%10s|%20s|%30s", groupId, groupName, createDate + "\n");
	}
}
