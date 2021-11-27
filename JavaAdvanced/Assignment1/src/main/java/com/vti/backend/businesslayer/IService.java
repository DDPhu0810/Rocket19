package com.vti.backend.businesslayer;

import java.util.List;

import com.vti.entity.Group;
import com.vti.until.MyException;

public interface IService {

	void create(Group group);

	List<Group> getAll();

	Group getById(int id) throws MyException;

	Group getByName(String name);

	int update(Group group, int id);

	int delete(int id) throws MyException;

	Group isExistsByID(int id) throws MyException;

	Group isExistsByName(String name);

}
