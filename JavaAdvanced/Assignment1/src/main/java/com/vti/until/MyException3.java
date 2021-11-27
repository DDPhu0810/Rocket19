package com.vti.until;

public class MyException3 extends Exception {
	int typeEx;
	public MyException3(String mess, int type) {
		super(mess);
		this.typeEx=type;
	}
}
