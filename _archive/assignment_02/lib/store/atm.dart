import 'dart:collection';
import 'dart:io';

import '../model/account.dart';
import '../model/bank.dart';

class ATM extends Bank {
  HashSet<Account> accountList = HashSet<Account>();

  // 2. Create a new Account
  @override
  void saveAccount() {
    // code: required (loop until non-empty)
    String code;
    while (true) {
      stdout.write("Enter code: ");
      String? input = stdin.readLineSync();
      if (input == null) {
        print("No more input. Cancelling save.\n");
        return;
      }
      if (input.trim().isEmpty) {
        print("Code is required.");
        continue;
      }
      code = input.trim();
      break;
    }

    // name: required (loop until non-empty)
    String name;
    while (true) {
      stdout.write("Enter name: ");
      String? input = stdin.readLineSync();
      if (input == null) {
        print("No more input. Cancelling save.\n");
        return;
      }
      if (input.trim().isEmpty) {
        print("Name is required.");
        continue;
      }
      name = input.trim();
      break;
    }

    // balance: must be numeric and greater than $50 (loop + try catch)
    double balance = 0;
    while (true) {
      stdout.write("Enter balance: ");
      String? input = stdin.readLineSync();

      if (input == null) {
        print("No more input. Cancelling save.\n");
        return;
      }

      try {
        balance = double.parse(input);
        if (balance <= 50) {
          print("Balance must be greater than \$50.");
          continue;
        }
        break;
      } catch (_) {
        print("Balance must be a numeric value.");
      }
    }

    accountList.add(Account(code, name, balance));
    print("Account saved successfully.\n");
  }

  // 3. Search by code
  @override
  void findByCode(String code) {
    for (var account in accountList) {
      if (account.code == code) {
        print(account);
        return;
      }
    }

    print("Account with code $code not found!\n");
  }

  // 4. Sum of all account balances
  @override
  void totalMoney() {
    double total = 0;

    for (var account in accountList) {
      total += account.getBalance();
    }

    print("Total money: ${total.toStringAsFixed(2)}\n");
  }

  // 5. Save account list to file
  @override
  void writeToFile(String fileName) {
    try {
      File file = File(fileName);
      StringBuffer buffer = StringBuffer();

      for (var account in accountList) {
        buffer.writeln(account.toCsv());
      }

      file.writeAsStringSync(buffer.toString());
      print("Saved to $fileName\n");
    } on IOException catch (e) {
      print(e);
    }
  }
}
