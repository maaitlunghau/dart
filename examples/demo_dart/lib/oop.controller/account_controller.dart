import 'package:demo_dart/oop.model/account.dart';

// Account controller
class AccountController {
  // Deposit money into the account
  void deposit(Account account, double amount) {
    if (amount > 0) {
      account.balance += amount;
    }
  }

  // Withdraw money from the account
  void withdraw(Account account, double amount) {
    if (amount > 0 && amount <= account.balance) {
      account.balance -= amount;
    }
  }
}
