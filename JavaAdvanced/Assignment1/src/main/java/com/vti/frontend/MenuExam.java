package com.vti.frontend;

import java.util.Date;
import java.util.List;

import com.vti.backend.presentation.ExamController;
import com.vti.entity.Exam;
import com.vti.until.MyScan;

public class MenuExam {
	ExamController examController;
	Exam exam = new Exam();
	List<Exam> listExams;

	public MenuExam() {
		examController = new ExamController();
		menu();
	}

	private void menu() {
		int selected = 0;

		while (selected != 9) {
			System.out.println("---------- Chọn chức năng -------- ");
			System.out.println("1: Create new exam");
			System.out.println("2: Get all exam");
			System.out.println("3: Get exam by id");
			System.out.println("4: Get exam by name");
			System.out.println("5: Update exam");
			System.out.println("6: Delete exam");
			System.out.println("7: Check exam by id");
			System.out.println("8: Check exam by Name");
			System.out.println("9: Exit");
			selected = MyScan.scInt();
			switch (selected) {
			case 1:
				createExam();
				break;
			case 2:
				getAllExam();
				break;
//			case 3:
//				getGroupById();
//				break;
//			case 4:
//				getGroupByName();
//				break;
//			case 5:
//				updateGroup();
//				break;
//			case 6:
//				deleteGroup();
//				break;
//			case 7:
//				isGroupExistsByID();
//				break;
//			case 8:
//				isGroupExistsByName();
//				break;
			case 9:
				System.out.println("---- Exit Success ---- ");
				break;
			}

		}

	}

	private void createExam() {
		System.out.println("Nhập vào title");
		String title = MyScan.scStr();
		System.out.println("Nhập vào duration");
		int duration = MyScan.scInt();
		System.out.println("Nhập vào date");
		Date date = MyScan.inputLocalDate();
		exam = new Exam(title, duration, date);
		examController.create(exam);
	}

	private void getAllExam() {
		listExams = examController.getAll();
		for (Exam exam : listExams) {
			System.out.println(exam);
		}
	}

//	private void getGroupById() {
//		boolean check = false;
//		while (!check) {
//			try {
//				System.out.println("Nhập vào id group cần tìm");
//				int id = MyScan.scInt();
//				if (id > 0) {
//					check = true;
//				}
//				group = myController.getById(id);
//				if (group == null) {
//					System.out.println("Không có group nào có id là: " + id);
//				} else {
//					group.printfForm();
//					group.printfGroup();
//				}
//			} catch (MyException e) {
//				System.err.println(e.getMessage());
//			}
//		}
//	}
//
//	private void getGroupByName() {
//		System.out.println("Nhập vào name group cần tìm");
//		String name = MyScan.scStr();
//		group = myController.getByName(name);
//		System.out.println();
//		if (group == null) {
//			System.out.println("Không có group nào có name là: " + name);
//		} else {
//			group.printfForm();
//			group.printfGroup();
//		}
//	}
//
//	private void updateGroup() {
//		boolean check = false;
//		while (!check) {
//			System.out.println("Nhập vào id group cần update");
//			int id = MyScan.scInt();
//			if (id > 0) {
//				check = true;
//			}
//			try {
//				group = myController.getById(id);
//				if (group == null) {
//					System.out.println("Không có group nào có id là: " + id);
//				} else {
//					group.printfForm();
//					group.printfGroup();
//					System.out.println("Nhập id");
//					int groupID = MyScan.scInt();
//					System.out.println("Nhập name");
//					String groupName = MyScan.scStr();
//					Group groupUpdate = new Group(groupID, groupName);
//					int result = myController.update(groupUpdate, id);
//					if (result > 0) {
//						System.out.println("Update success");
//					} else {
//						System.out.println("Update fail");
//					}
//				}
//			} catch (MyException e) {
//				System.err.println(e.getMessage());
//			}
//		}
//	}
//
//	private void deleteGroup() {
//		boolean check = false;
//		while (!check) {
//			System.out.println("Nhập vào id group cần xóa");
//			int id = MyScan.scInt();
//			if (id > 0) {
//				check = true;
//			}
//			try {
//				int result = myController.delete(id);
//				if (result > 0) {
//					System.out.println("Delete succesS");
//				} else {
//					System.out.println("Delete Fail");
//				}
//			} catch (MyException e) {
//				System.err.println(e.getMessage());
//			}
//		}
//	}
//
//	private void isGroupExistsByID() {
//		boolean check = false;
//		while (!check) {
//			System.out.println("Nhập vào id group cần check");
//			int id = MyScan.scInt();
//			if (id > 0) {
//				check = true;
//			}
//			try {
//				group = myController.isExistsByID(id);
//				if (group != null) {
//					System.out.println("Group Exists");
//				}
//				else {
//					System.out.println("Group Not Exists");
//				}
//			} catch (MyException e) {
//				System.err.println(e.getMessage());
//			}
//
//		}
//	}
//
//	private void isGroupExistsByName() {
//		System.out.println("Nhập vào name group cần check");
//		String name = MyScan.scStr();
//		group = myController.isExistsByName(name);
//		if (group == null) {
//			System.out.println("Group Exists");
//		} else {
//			System.out.println("Group Not Exists");
//		}
//	}
}
