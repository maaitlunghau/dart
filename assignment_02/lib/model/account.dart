class Account {
  // 1. Properties
  String code;
  String name;
  double balance;

  // 2. Constructor
  Account(this.code, this.name, this.balance);

  // 3. Method required
  double getBalance() {
    return balance;
  }

  // 4. Display helper
  @override
  String toString() {
    return "Code: $code\tName: $name\tBalance: ${balance.toStringAsFixed(2)}";
  }

  // 5. Row format
  String toCsv() {
    return "$code,$name,$balance";
  }
}
