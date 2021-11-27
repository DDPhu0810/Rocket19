package com.vti.backend.businesslayer;

import java.util.List;

import com.vti.backend.datalayer.GroupDao;
import com.vti.backend.datalayer.GroupRepository;
import com.vti.entity.Group;
import com.vti.until.MyException;

public class MyService implements IService {
	GroupDao groupDao;

	public MyService() {
		groupDao = new GroupRepository();
	}

	public void create(Group group) {
		groupDao.create(group);

	}

	public List<Group> getAll() {
		return groupDao.getAll();
	}

	public Group getById(int id) throws MyException {
		if (id <= 0) {
			throw new MyException("Id group phải lớn hơn 0", 1);
		}
		return groupDao.getById(id);
	}

	public Group getByName(String name) {
		return groupDao.getByName(name);
	}

	public int update(Group group, int id) {
		return groupDao.update(group, id);
	}

	public int delete(int id) throws MyException {
		if (id <= 0) {
			throw new MyException("Id group phải lớn hơn 0", 1);
		}
		return groupDao.delete(id);
	}

	public Group isExistsByID(int id) throws MyException {
		if (id <= 0) {
			throw new MyException("Id group phải lớn hơn 0", 1);
		}
		return groupDao.getById(id);
		
	}

	public Group isExistsByName(String name) {
		return groupDao.getByName(name);
	}

}
