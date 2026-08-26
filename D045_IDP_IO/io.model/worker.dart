/* Worker Model */
base class Worker {
  /* 1. Properties */
  late int _id;
  late String _name;
  late int _workdays;
  late double _perRentDay;

  /* 2. Constructor */
  Worker();

  /* 3. Getter and Setter */
  int get id => _id;

  set id(int value) {
    _id = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  int get workdays => _workdays;

  set workdays(int value) {
    _workdays = value;
  }

  double get perRentDay => _perRentDay;

  set perRentDay(double value) {
    _perRentDay = value;
  }

  /* 4. Calculate total */
  double total() {
    // return (_workdays * _perRentDay) + 100000 - 50;
    return (_workdays * _perRentDay);
  }

  /* 5. Convert Worker to String */
  String output() {
    return [id, name, workdays, perRentDay, total()].join("\t\t");
  }
}

/*
	+ 'base' keyword cho extends nhưng không cho implements
	+ 'late' đảm bảo biến sẽ được khởi tạo giá trị trước khi được đọc
	+ '=>' expression
		→ tương đương { return expression; }

	+ Getter:
	int get id => _id;
	----
	int get id {
		return _id;
	}
	+ Setter:
	set id(int value) => _id = value;
	----
	set id(int value) {
		_id = value;
	}

*/
