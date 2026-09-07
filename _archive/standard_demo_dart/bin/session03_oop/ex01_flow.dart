/*
  session03_oop:
    ex01: Class -> Object -> Properties
    ex02: Class -> Constructor -> Object initialization
    ex03: Object -> Method -> Object performs an action
    ex04: Private Field -> Getter / Setter -> Controlled Access
    ex05: Model -> Controller -> Application
  
  Flow 1:
    Class -> Create Object -> Set Properties -> Access Properties and Display Result
*/

/* 1. Account class */
class Account {
  //Properties
  String name = "";
  double balance = 0;
}

/* 2. main */
void main() {
  //2.1. Create object
  var account = Account();

  //2.2. Set properties
  account.name = "John";
  account.balance = 1000;

  //2.3. Access properties and display result
  print("Name: ${account.name}");
  print("Balance: ${account.balance}");
}
