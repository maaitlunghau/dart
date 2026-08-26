/*
  Flow 4: Inheritance
    Person -> Employee -> implements / override

  + Note:
	1. implements
		- A class follows the structure of another class.
		- Required methods must be overridden.

	2. extends
		- A class inherits everything from another class.
		- Existing methods can be used directly or overridden.
*/

/* 1. Person class */
abstract class Person {
	// Abstract method
	void display();
}

/* 2. Employee class */
class Employee implements Person {
	// 2.1. Properties
	String name;
	double salary;

	// 2.2. Constructor
	Employee(this.name, this.salary);

	// 2.3. Override method
	@override
	void display() {
		print("$name has $salary USD");
	}
}

/* 3. main */
void main() {
	// 3.1. Create Employee objects
	Employee emp1 = Employee("Bill", 1000);
	Employee emp2 = Employee("Steve", 2000);

	// 3.2. Display employees
	emp1.display();
	emp2.display();
}