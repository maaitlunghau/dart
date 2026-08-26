/*
  Flow 5: Employee Management
    Person -> Employee implements Person
Note:
    1. 'package:demo_dart/inheritance.model/person.dart'
    2. without using 'bin' or 'lib'
*/

import 'package:demo_dart/inheritance.model/person.dart';

/* 1. Employee class */
class Employee implements Person {
	//1.1. Properties - Bắt buộc phải khởi tạo
	String _name = "";
	String _skills = "";
	double _salary = 0.0;

	//1.2. Getters
	String get name => _name;
	String get skills => _skills;
	double get salary => _salary;

	//1.3. Setters
	set name(String value) {
    if (value.isEmpty) {
      throw Exception("Name is required...");
    }
    	_name = value;
  	}

	set skills(String value) {
    if (value.isEmpty) {
      throw Exception("Skills are required...");
    }
		_skills = value;
	}

	set salary(double value) {
    if (value < 0 || value.isNaN) {
      throw Exception("Salary must be greater than 0...");
    }
		_salary = value;
	}

	// 1.4. Override display()
	@override
	void output() {
		print("+ Name: $name\n+ Skills: $skills\n+ Salary: $salary");
	}
}
