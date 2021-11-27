package com.vti.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Answer", catalog = "TestingSystem_JavaAdvanced")
public class Answer {
	
	@Id
	@Column(name = "Answers")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int answers;
	
	@Column(name = "Content", length = 100, nullable = false)
	String content;
	
	@Column(name = "isCorrect", columnDefinition =  "bit default 1")
	boolean isCorrect;

	public Answer() {
		super();
	}

	public Answer(int answers, String content, boolean isCorrect) {
		super();
		this.answers = answers;
		this.content = content;
		this.isCorrect = isCorrect;
	}

	public int getAnswers() {
		return answers;
	}

	public void setAnswers(int answers) {
		this.answers = answers;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public boolean isCorrect() {
		return isCorrect;
	}

	public void setCorrect(boolean isCorrect) {
		this.isCorrect = isCorrect;
	}

	@Override
	public String toString() {
		return "Answer [answers=" + answers + ", content=" + content + ", isCorrect=" + isCorrect + "]";
	}

	
}
