package com.vti.backend.datalayer;

import java.util.List;

public interface Dao<T> {
	void create(T t);
	List<T> getAll();
}
