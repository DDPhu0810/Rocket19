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
@Table(name = "Question", catalog = "TestingSystem_JavaAdvanced")
public class Question {
	
	@Id
	@Column(name = "QuestionID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int questionId;
	
	
	@Column(name = "Content", length = 100, nullable = false)
	String content;
	
	@Column(name = "CreateDate")
	@Temporal(TemporalType.TIMESTAMP)
	@CreationTimestamp
	Date createDate;

	public Question() {
		super();
	}

	public Question(int questionId, String content, Date createDate) {
		super();
		this.questionId = questionId;
		this.content = content;
		this.createDate = createDate;
	}

	public int getQuestionId() {
		return questionId;
	}

	public void setQuestionId(int questionId) {
		this.questionId = questionId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	@Override
	public String toString() {
		return "Question [questionId=" + questionId + ", content=" + content + ", createDate=" + createDate + "]";
	}
	
}
