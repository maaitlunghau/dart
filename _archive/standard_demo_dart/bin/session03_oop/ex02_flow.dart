/*
    session03_oop:
    ex01: Class -> Object -> Properties
    ex02: Class -> Constructor -> Object initialization
    ex03: Object -> Method -> Object performs an action
    ex04: Private Field -> Getter / Setter -> Controlled Access
    ex05: Model -> Controller -> Application

  Flow 2:
    Class -> Constructor -> Create Object -> Access Properties -> Display Result
*/

/* 1. Account class */
class Account {
  //1.1. Properties
  String name;
  double balance;

  //1.2. Constructor
  Account(this.name, this.balance);
}

/* 2. main */
void main() {
  //2.1. Create an Account object with initial values
  var account = Account("John", 1000);

  // 2.2. Access properties and display result
  print("Name: ${account.name}");
  print("Balance: ${account.balance}");
}
