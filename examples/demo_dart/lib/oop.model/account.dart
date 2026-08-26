// Account model
class Account {
  // Account fields
  String name;
  double _balance;

  // Constructor
  Account(this.name, this._balance);

  // Getter
  double get balance {
    return _balance;
  }

  // Setter
  set balance(double value) {
    if (value >= 0) {
      _balance = value;
    }
  }

  // Override toString() to display account information
  @override
  String toString() {
    return "Name: $name, Balance: ${_balance.toStringAsFixed(2)}";
  }
}
