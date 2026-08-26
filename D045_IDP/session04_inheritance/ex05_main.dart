/*
  Main Flow: Employee Management

    Person -> Employee implements Person -> EmployeeController -> Map<String, Employee> -> Main

  + Main point:
  - Apply inheritance and collection.
  - Separate View, Controller and Model.
*/

import 'dart:io';
import 'package:demo_dart/inheritance.controller/employee_controller.dart';

/* 1. Menu */
void menu() {
  print("......Employee Management System....");
  print("1. Add new employee");
  print("2. Display all");
  print("3. Delete employee");
  print("4. Exit");
  print("...................................");
}

/* 2. main */
void main() {
	EmployeeController controller = EmployeeController();
	menu();

	while (true) {	
		print("");
		stdout.write("Enter your choice [1 - 4]: ");
		int? option = int.tryParse(stdin.readLineSync()!);

		switch (option) {
			case 1:
				controller.addNew();
				break;

			case 2:
				controller.display();
				break;

			case 3:
				stdout.write("Enter name to delete: ");
				controller.delete(stdin.readLineSync()!);
				break;

			case 4:
			print("Goodbye!");
			exit(0);

			default:
			print("Your choice is incorrect!");
		}
	}
}
