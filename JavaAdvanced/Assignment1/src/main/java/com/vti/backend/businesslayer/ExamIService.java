package com.vti.backend.businesslayer;

import java.util.List;

import com.vti.entity.Exam;

public interface ExamIService {
	
	void create(Exam exam);
	
	int getCountOfExamCode(int duration);
	
	List<Exam> getAll();
}
