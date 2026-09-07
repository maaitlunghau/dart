/*
  session03_oop:
    ex01: Class -> Object -> Properties
    ex02: Class -> Constructor -> Object initialization
    ex03: Object -> Method -> Object performs an action
    ex04: Private Field -> Getter / Setter -> Controlled Access
    ex05: Model -> Controller -> Application

  Flow 4:
    Class -> Private Field -> Controlled Access -> Getter -> Setter -> Object Uses Public Properties

  Note:
    + private field: _balance
    + GET: double get balance => _balance;
    + SET: set balance(double value) => _balance = value;
*/

/* 1. Account class */
class Account {
  //1.1. Properties
  String name;
  double _balance;

  //1.2. Constructor
  Account(this.name, this._balance);

  //1.3. Getter
  double get balance {
    return _balance;
  }

  //1.4. Setter
  set balance(double value) {
    if (value >= 0) {
      _balance = value;
    }
  }

  //1.5. Display account information
  void display() {
    print("Name: $name");
    print("Balance: $balance");
  }
}

/* 2. main */
void main() {
  /* 2.1. Create an Account object */
  var account = Account("John", 1000);

  //2.2. Access balance getter
  print("Initial balance: ${account.balance}");

  // 2.3. Change value by balance setter
  account.balance = 1500;

  //2.4. Try to set an invalid balance
  account.balance = -500;

  //2.5. Display result
  account.display();
}
