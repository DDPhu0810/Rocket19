package com.vti.backend.datalayer;

import com.vti.entity.Group;

public interface GroupDao extends Dao<Group>{

	Group getById(int id);

	Group getByName(String name);

	int update(Group group, int id);

	int delete(int id);
}
