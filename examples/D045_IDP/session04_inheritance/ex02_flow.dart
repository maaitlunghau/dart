/*
  Flow 2: List
    List<Employee>: add, addAll, remove, removeAt, length, index
*/
import 'ex01_flow.dart';

void main(List<String> args) {
	// 2.1. Create List
	List<Employee> emps = [
		Employee("Bill", 1000),
		Employee("Steve", 2000)
	];
	
	print("2.1. There are ${emps.length} employees:");
	print("\t=> $emps");
	
	// 2.2. Add an employee
	emps.add(Employee("Will", 3000));
	print("2.2. Add 'Will' to list:");
	print("\t=> $emps");

	// 2.3. Add multiple emps
	emps.addAll([
		Employee("Phil", 4000), 
		Employee("Liu", 5000)
	]);
	print("2.3. Add multiple emps to list:");
	print("\t=> $emps");

	// 2.4. Access the first
	print("2.4. First employee is => '${emps[0]}'");

	// 2.5. Remove an employee
	emps.remove(emps[1]);
	print("2.5. After remove 'Steve':");
	print("\t=> $emps");

	// 2.6. Remove an employee by index
	emps.removeAt(0);
	print("2.6. After remove first employee:");
	print("\t=> $emps");
	print("\t=> There are ${emps.length} employees");
	
	
	
}
