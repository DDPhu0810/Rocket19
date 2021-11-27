package com.vti.backend.presentation;

import java.util.List;

import com.vti.backend.businesslayer.IService;
import com.vti.backend.businesslayer.MyService;
import com.vti.entity.Group;
import com.vti.until.MyException;

public class MyController {
	IService iService;

	public MyController() {
		iService = new MyService();
	}

	public void create(Group group) {
		iService.create(group);
	}

	public List<Group> getAll() {
		return iService.getAll();
	}

	public Group getById(int id) throws MyException {
		return iService.getById(id);

	}

	public Group getByName(String name) {
		return iService.getByName(name);
	}

	public int update(Group group, int id) {
		return iService.update(group, id);
	}

	public int delete(int id) throws MyException {
		return iService.delete(id);
	}

	public Group isExistsByID(int id) throws MyException {
		return iService.isExistsByID(id);
		
	}

	public Group isExistsByName(String name) {
		return iService.isExistsByName(name);
	}

}
