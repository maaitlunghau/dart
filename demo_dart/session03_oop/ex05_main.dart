/*
  flow 5
    Phân tầng
*/
import 'package:demo_dart/oop.controller/account_controller.dart';
import 'package:demo_dart/oop.model/account.dart';
import 'dart:io';

// Display the program menu
void menu() {
  print("--------------- ACCOUNT ---------------");
  print("1. Deposit");
  print("2. Withdraw");
  print("3. Display");
  print("4. Exit");
  print("---------------------------------------");
}

// Main program
void main() {
  Account account = Account("John", 1000);
  AccountController controller = AccountController();

  int option = 0;

  // Main loop
  do {
    menu();

    print("Enter option:");
    option = int.parse(stdin.readLineSync().toString());

    // Select an action based on user's choice
    switch (option) {
      case 1:
        print("Enter amount:");
        double amount = double.parse(stdin.readLineSync().toString());
        controller.deposit(account, amount);
        break;

      case 2:
        print("Enter amount:");
        double amount = double.parse(stdin.readLineSync().toString());
        controller.withdraw(account, amount);
        break;

      case 3:
        print(account);
        break;

      case 4:
        print("Exit.");
        exit(0);
    }
  } while (option != 4);
}

/*
  Import package:
    1. 'package:[project name]/[package name]/[file name].dart'
    2. Do not include 'bin' or 'lib'

  dart run bin/session03_oop/ex05_main.dart
  ---------
  Dart Library
   - Mỗi file .dart mặc định là một library.
   - Các class trong cùng file → cùng library → có thể truy cập private _member.
   - Khác file → khác library → không truy cập được _member.
   - Folder (lib, oop.entity,...) không quyết định library.
   - part / part of có thể ghép nhiều file thành một library.
*/
