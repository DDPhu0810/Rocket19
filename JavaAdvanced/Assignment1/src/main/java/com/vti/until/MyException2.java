package com.vti.until;

public class MyException2 extends Exception {
	int typeEx;
	public MyException2(String mess, int type) {
		super(mess);
		this.typeEx=type;
	}

}
