package com.vti.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Department", catalog = "TestingSystem_JavaAdvanced")
public class Department {
	
	@Id
	@Column(name = "DepartmentID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int departmentId;
	
	@Column(name = "DepartmentName", unique = true, nullable = false, length = 30)
	String departmentName;

	public Department() {
		super();
	}

	public Department(String departmentName) {
		super();
		this.departmentName = departmentName;
	}

	public Department(int departmentId, String departmentName) {
		super();
		this.departmentId = departmentId;
		this.departmentName = departmentName;
	}

	public int getDepartmentId() {
		return departmentId;
	}

	public void setDepartmentId(int departmentId) {
		this.departmentId = departmentId;
	}

	public String getDepartmentName() {
		return departmentName;
	}

	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}

	@Override
	public String toString() {
		return "Department [departmentId=" + departmentId + ", departmentName=" + departmentName + "]";
	}

	
}
