package com.vti.backend.datalayer;

import com.vti.entity.Exam;

public interface ExamDao extends Dao<Exam>{
	int getCountOfExamCode(int duration);
}
