package com.vti.backend.datalayer;

import java.util.List;

import org.hibernate.query.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.vti.entity.Exam;
import com.vti.until.HiberneteUtil;

public class ExamRepository implements ExamDao {

	public void create(Exam exam) {
		Session session = HiberneteUtil.getFactory().openSession();
		Transaction transaction = session.beginTransaction();
		session.save(exam);
		transaction.commit();
		session.close();
	}

	public List<Exam> getAll() {
		Session session = HiberneteUtil.getFactory().openSession();
		Query<Exam> query = session.createQuery("FROM Exam");
		List<Exam> listExams = query.list();
		session.close();
		return listExams;
	}

	@SuppressWarnings({ "unchecked" })
	public int getCountOfExamCode(int duration) {
		Session session = HiberneteUtil.getFactory().openSession();
		String sql;

		if (duration >= 180) {
			sql = "SELECT COUNT(1) FROM Exam  WHERE Duration >= 180";
		} else if (duration < 180 && duration >= 90) {
			sql = "SELECT COUNT(1) FROM Exam  WHERE Duration < 180 AND Duration >= 90";
		} else {
			sql = "SELECT COUNT(1) FROM Exam  WHERE Duration < 90";
		}
		
		Query<Long> query = session.createQuery(sql);

		int count = query.uniqueResult().intValue();
		return count;
	}

}
