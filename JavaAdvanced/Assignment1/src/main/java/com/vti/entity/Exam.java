package com.vti.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.CreationTimestamp;

import com.vti.backend.presentation.ExamController;

@Entity
@Table(name = "Exam", catalog = "TestingSystem_JavaAdvanced")
public class Exam {

	@Id
	@Column(name = "ExamID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int examId;

	@Column(name = "Code1", length = 10, nullable = false)
	String code1;
	
	@Column(name = "Code2", length = 10)
	String code2;

	@Column(name = "Title", nullable = false, length = 50)
	String title;

	@Column(name = "Duration", nullable = false, columnDefinition = "int default 45")
	int duration;

	@Column(name = "CreateDate")
	@Temporal(TemporalType.TIMESTAMP)
	@CreationTimestamp
	Date createDate;

	@PrePersist
	public void beforeSaveToDB() {
		if (code1 == null) {
			ExamController examController = new ExamController();
			
			String code;

			if (duration >= 180) {
				code = "L";
			} else if (duration >= 90 && duration < 180) {
				code = "M";
			} else {
				code = "S";
			}
			int countcode = examController.getCountOfExamCode(duration);
			code1 = code + "-" + (countcode + 1);
		}
	}

	public Exam() {
		super();
	}

	public Exam(String title, int duration, Date createDate) {
		super();
		this.title = title;
		this.duration = duration;
		this.createDate = createDate;
	}

	public int getExamId() {
		return examId;
	}

	public void setExamId(int examId) {
		this.examId = examId;
	}

	public String getCode1() {
		return code1;
	}

	public void setCode1(String code1) {
		this.code1 = code1;
	}

	public String getCode2() {
		return code2;
	}

	public void setCode2(String code2) {
		this.code2 = code2;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getDuration() {
		return duration;
	}

	public void setDuration(int duration) {
		this.duration = duration;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	@Override
	public String toString() {
		return "Exam [examId=" + examId + ", code1=" + code1 + ", code2=" + code2 + ", title=" + title + ", duration="
				+ duration + ", createDate=" + createDate + "]";
	}
	
	
}
