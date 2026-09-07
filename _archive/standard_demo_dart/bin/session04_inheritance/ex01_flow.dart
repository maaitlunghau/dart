/*
  + Flow 1: Dùng List
      Employee -> List<Employee>

  + Note: 
  	- List stores multiple ordered objects.
	- Contructor
		Case1: 
			Employee(String name, double salary) :
				this.name = name, 
				this.salary = salary;
		Case2: Employee(this.name, this.salary);
  	- Dart collection types
		. Iterable: List, Set, Queue
		. Map (key-value pairs)
*/

/* 1. Employee class */
class Employee{
	//1.1. Properties
	String name;
	double salary;

	//1.2. Constructor
	Employee(this.name, this.salary);

	@override
  	String toString(){
		return "$name ($salary USD)";
	}
}

/* 2. Main */
void main(List<String> args) {
	//2.1. Create objects
	Employee emp1 = Employee("Bill", 1000);
	Employee emp2 = Employee("Steve", 2000);
	Employee emp3 = Employee("Will", 3000);

	//2.2. Create a List
	List<Employee> emps = [
		emp1,
		emp2,
		emp3
	];

	//2.3. Display all employees
	emps.forEach(print);
	
}