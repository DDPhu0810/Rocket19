package com.vti.entity;

import javax.persistence.Column;
import javax.persistence.Convert;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.vti.entity.enumerate.SalaryName;
import com.vti.entity.enumerate.SalaryNameConvert;

@Entity
@Table(name = "Salary", catalog = "TestingSystem_JavaAdvanced")
public class Salary {
	
	@Id
	@Column(name = "SalaryID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int salaryId;
	
	@Column(name = "SalaryName", nullable = false, unique = true)
	@Convert(converter = SalaryNameConvert.class)
	SalaryName salaryName;

	public Salary() {
		super();
	}

	public Salary(int salaryId, SalaryName salaryName) {
		super();
		this.salaryId = salaryId;
		this.salaryName = salaryName;
	}

	public int getSalaryId() {
		return salaryId;
	}

	public void setSalaryId(int salaryId) {
		this.salaryId = salaryId;
	}

	public SalaryName getSalaryName() {
		return salaryName;
	}

	public void setSalaryName(SalaryName salaryName) {
		this.salaryName = salaryName;
	}

	@Override
	public String toString() {
		return "Salary [salaryId=" + salaryId + ", salaryName=" + salaryName + "]";
	}
	
	

}
