/*
  session03_oop:
    ex01: Class -> Object -> Properties
    ex02: Class -> Constructor -> Object initialization
    ex03: Object -> Method -> Object performs an action
    ex04: Private Field -> Getter / Setter -> Controlled Access
    ex05: Model -> Controller -> Application

  Flow 3:
    Class -> Properties -> Constructor -> Object -> Object Performs an Action -> Display result
*/

/* 1. Account class */
class Account {
  //1.1. Properties
  String name;
  double balance;

  //1.2. Constructor
  Account(this.name, this.balance);

  //1.3. Deposit money into the account
  void deposit(double amount) {
    if (amount > 0) {
      balance += amount;
    }
  }

  //1.4. Display account information
  void display() {
    print("Name: $name");
    print("Balance: $balance");
  }
}

/* 2. main */
void main() {
  //2.1. Create an Account object
  var account = Account("John", 1000);

  //2.2. Object performs an action
  account.deposit(500);

  //2.3. Display result
  account.display();
}
