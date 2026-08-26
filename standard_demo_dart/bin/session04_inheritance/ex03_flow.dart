/*
  Flow 3: Map
    Map<key, value>: [key]=value, addAll, keys.first, remove, length
*/
import 'ex01_flow.dart';

void main(List<String> args) {
	// 2.1. Create Map (Key: name, Value: Employee)
	Map<String, Employee> emps = {
		"Bill": Employee("Bill", 1000),
		"Steve": Employee("Steve", 2000)
	};
	
	print("2.1. There are ${emps.length} employees (With Map):");
	print("\t=> ${emps.values}");
	
	// 2.2. Add an employee (Dùng toán tử gán [key] = value)
	emps["Will"] = Employee("Will", 3000);
	print("2.2. Add 'Will' to map:");
	print("\t=> ${emps.values}");

	// 2.3. Add multiple emps
	emps.addAll({
		"Phil": Employee("Phil", 4000), 
		"Liu": Employee("Liu", 5000)
	});
	print("2.3. Add multiple emps to map:");
	print("\t=> ${emps.values}");

	// 2.4. Access the first
	String firstKey = emps.keys.first; 
	print("2.4. First employee is => '${emps[firstKey]}'");

	// 2.5. Remove an employee bằng Key
	emps.remove("Steve");
	print("2.5. After remove 'Steve':");
	print("\t=> ${emps.values}");

	// 2.6. Remove an employee by index
	String firstRemainingKey = emps.keys.first;
	emps.remove(firstRemainingKey);
	print("2.6. After remove first employee:");
	print("\t=> ${emps.values}");
	print("\t=> There are ${emps.length} employees");
}