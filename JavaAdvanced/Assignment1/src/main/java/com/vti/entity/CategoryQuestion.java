package com.vti.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "CategoryQuestion", catalog = "TestingSystem_JavaAdvanced")
public class CategoryQuestion {
	
	@Id
	@Column(name = "CategoryID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int categoryId;
	
	
	@Column(name = "CategoryName", length = 50, nullable = false, unique = true)
	String CategoryName;


	public CategoryQuestion() {
		super();
	}

	public CategoryQuestion(String categoryName) {
		super();
		CategoryName = categoryName;
	}

	public CategoryQuestion(int categoryId, String categoryName) {
		super();
		this.categoryId = categoryId;
		CategoryName = categoryName;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public String getCategoryName() {
		return CategoryName;
	}

	public void setCategoryName(String categoryName) {
		CategoryName = categoryName;
	}

	@Override
	public String toString() {
		return "CategoryQuestion [categoryId=" + categoryId + ", CategoryName=" + CategoryName + "]";
	}
	
	
}
