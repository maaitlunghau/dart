import 'dart:io';

import 'package:assignment_02/store/atm.dart';

void menu() {
  print("--------------- BANK ATM ---------------");
  print("1. Save account");
  print("2. Find by code");
  print("3. Total money");
  print("4. Write to file");
  print("5. Exit");
  print("------------------------------------------");
}

void main() {
  ATM atm = ATM();
  int? option;

  do {
    menu();

    stdout.write("Enter your choice [1-5]: ");
    String? input = stdin.readLineSync();

    if (input == null) {
      print("No more input. Exit.");
      break;
    }

    option = int.tryParse(input);

    switch (option) {
      case 1:
        atm.saveAccount();
        break;

      case 2:
        stdout.write("Enter code to find: ");
        String? code = stdin.readLineSync();

        if (code == null) {
          print("No more input.\n");
          break;
        }

        atm.findByCode(code);
        break;

      case 3:
        atm.totalMoney();
        break;

      case 4:
        atm.writeToFile("bank.csv");
        break;

      case 5:
        print("Goodbye!");
        exit(0);

      default:
        print("Your choice is incorrect!\n");
    }
  } while (option != 5);
}
