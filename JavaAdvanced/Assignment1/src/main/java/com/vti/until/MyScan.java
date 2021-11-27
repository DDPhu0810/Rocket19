package com.vti.until;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.Scanner;

public class MyScan {
	static Scanner scan = new Scanner(System.in);

	public static int scInt() {
		boolean ok = false;
		int number = 0;
		do {
			try {
				number = Integer.parseInt(scan.next().trim());
				scan.nextLine();
				ok = true;
			} catch (NumberFormatException e) {
				System.err.println("Giá trị vừa nhập không phải là số! Nhập lại!");
			}
		} while (!ok);

		return number;
	}

	public static int inputIntPositive() {
		while (true) {
			try {
				int intPositive = Integer.parseInt(scan.next());
				if (intPositive >= 0) {
					return intPositive;
				} else {
					System.err.println("Hãy nhập vào số nguyên dương!");
				}
			} catch (Exception e) {
				System.err.println("Giá trị vừa nhập không phải là số! Nhập lại!");
			}
		}
	}

	public static float scFloat() {
		boolean ok = false;
		float number = 0;
		do {
			try {
				number = Float.parseFloat(scan.next());
				scan.nextLine();
				ok = true;
			} catch (NumberFormatException e) {
				System.err.println("Giá trị vừa nhập không phải là số! Nhập lại!");
			}
		} while (!ok);

		return number;
	}

	public static Double scDouble() {
		while (true) {
			try {
				return Double.parseDouble(scan.next());
			} catch (Exception e) {
				System.err.println("Giá trị vừa nhập không phải là số! Nhập lại!");
			}
		}
	}

	public static String scStr() {
		return scan.nextLine();
	}

	public static void close() {
		scan.close();
	}

	public static Date inputLocalDate() {
		System.out.println("Nhập theo định dạng yyyy-MM-dd HH:mm:ss(Nhập 'exit' để bỏ qua)");
		SimpleDateFormat fomat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		while (true) {
			String date = scan.nextLine();
			if(date.equals("exit")){
				break;
			}
			try {
				if (fomat.parse(date) != null) {
					Date lc = fomat.parse(date);
					return lc;
				}
			} catch (Exception e) {
				System.err.println("Sai định dạng! Nhập lại!");
			}
		}
		return null;
	}
}
