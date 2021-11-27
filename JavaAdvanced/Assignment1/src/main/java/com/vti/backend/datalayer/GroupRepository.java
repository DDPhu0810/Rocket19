package com.vti.backend.datalayer;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.vti.entity.Group;
import com.vti.until.HiberneteUtil;

public class GroupRepository implements GroupDao {

	public void create(Group group) {
		Session session = HiberneteUtil.getFactory().openSession();

		Transaction transaction = session.beginTransaction();

		session.save(group);

		transaction.commit();

		session.close();
	}

	public List<Group> getAll() {
		Session session = HiberneteUtil.getFactory().openSession();
		Query<Group> query = session.createQuery("FROM Group ");
		List<Group> listGroups = query.list();
		session.close();
		return listGroups;
	}

	public Group getById(int id) {
		Session session = HiberneteUtil.getFactory().openSession();
		Group group = session.get(Group.class, id);
		session.close();
		return group;
	}

	public Group getByName(String name) {
		Session session = HiberneteUtil.getFactory().openSession();
		Query query = session.createQuery("FROM Group WHERE GroupName = '" + name + "'");
		Group group = (Group) query.uniqueResult();
		session.close();
		return group;
	}

	public int update(Group group, int id) {
		Session session = HiberneteUtil.getFactory().openSession();
		Transaction transaction = session.beginTransaction();
//		Query query = session.createQuery("UPDATE Group set GroupID = "+group.getGroupId() +", GroupName = '"+group.getGroupName() + "' WHERE GroupID =" +id);
		Query query = session.createQuery("UPDATE Group set GroupID = :groupID, GroupName = :groupName" + " WHERE GroupID = :id");
		query.setParameter("groupID", group.getGroupId());
		query.setParameter("groupName", group.getGroupName());
		query.setParameter("id", id);
		int result = query.executeUpdate();
		transaction.commit();
		session.close();
		return result;
	}

	public int delete(int id) {
		Session session = HiberneteUtil.getFactory().openSession();
		Transaction transaction = session.beginTransaction();
		Query query = session.createQuery("DELETE FROM Group WHERE id="+id);
		int result = query.executeUpdate();
		transaction.commit();
		session.close();
		return result;
	}
}
