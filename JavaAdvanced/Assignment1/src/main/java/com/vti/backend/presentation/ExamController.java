package com.vti.backend.presentation;

import java.util.List;

import com.vti.backend.businesslayer.ExamIService;
import com.vti.backend.businesslayer.ExamService;
import com.vti.entity.Exam;

public class ExamController {
	ExamIService examIService;
	
	public ExamController() {
		examIService = new ExamService();
	}
	
	public void create(Exam exam) {
		examIService.create(exam);
	}
	
	public int getCountOfExamCode(int duration) {
		return examIService.getCountOfExamCode(duration);
	}

	public List<Exam> getAll() {
		return examIService.getAll();
	}
}
