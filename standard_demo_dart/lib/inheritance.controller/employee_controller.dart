/*
  Flow 5: Employee Management
    EmployeeController -> Map<String, Employee>
	dart run bin/session04_inheritance/ex05_main.dart
*/

import 'dart:io';
import 'package:standard_demo_dart/inheritance.model/employee.dart';

/* 1. EmployeeController class */
class EmployeeController {
	// 1.1. Uses Map Literal '{}' (LinkedHashMap) - Built-in, no import required
	final Map<String, Employee> employees = {};

	// 1.2. addNew() method
	void addNew() {
		Employee employee = Employee();

		//name
		while (true) {
			try {
			stdout.write("Enter name: ");
			String value = stdin.readLineSync()!;

			if (employees.containsKey(value)) {
				print("This employee name already exists!");
				continue;
			}

			employee.name = value;
			break;
			} catch (_) {
			// Thay catch (error) bằng catch (_) vì không dùng đến biến error
			print("Name is required.");
			}
		}

		//skills
		while (true) {
			try {
			stdout.write("Enter skills: ");
			employee.skills = stdin.readLineSync()!;
			break;
			} catch (_) {
			// Thay catch (error) bằng catch (_)
			print("Skills are required.");
			}
		}

		//salary
		while (true) {
			try {
			stdout.write("Enter salary: ");
			employee.salary = double.parse(stdin.readLineSync()!);
			break;
			} catch (_) {
			print("Salary must be a valid number >= 0.");
			}
		}

		//Add employee to Map
		employees[employee.name] = employee;
	}

	// 1.3. Display() method
	void display() {
		if (employees.isEmpty) {
			print("Employee list is empty.\n");
			return;
		}
		print("----------------------------------");
		print("List of Employee(s):");
		print("----------------------------------");
		
		for (var emp in employees.values) {
			emp.output();
			print("----------------");
		}
	}

	// 1.4. Search and delete employee
	void delete(String name) {
		String key = name.trim();
		if (employees.containsKey(key)) {
			employees.remove(key);
			print("'$key' is deleted successfully.\n");
		} else {
			print("'$key' is not found!\n");
		}
	}
}
