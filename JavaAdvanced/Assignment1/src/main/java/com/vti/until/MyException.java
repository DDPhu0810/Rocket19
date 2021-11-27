package com.vti.until;

public class MyException extends Exception {
	int typeEx;

	public MyException(String mess, int type) {
		super(mess);
		this.typeEx = type;
	}

	
}
