package com.vti.backend.businesslayer;

import java.util.List;

import com.vti.backend.datalayer.ExamDao;
import com.vti.backend.datalayer.ExamRepository;
import com.vti.entity.Exam;

public class ExamService implements ExamIService{
	ExamDao examDao;
	
	public ExamService() {
		examDao = new ExamRepository();
	}
	public void create(Exam exam) {
		examDao.create(exam);
	}
	public int getCountOfExamCode(int duration) {
		return examDao.getCountOfExamCode(duration);
	}
	public List<Exam> getAll() {
		return examDao.getAll();
	}

}
