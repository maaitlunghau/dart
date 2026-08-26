import 'dart:io';

import 'package:assignment_01/store/shop_store.dart';

/* R4: Menu */
void menu() {
  print("--------------- SHOP STORE ---------------");
  print("add     - Add new calculator");
  print("delete  - Delete calculator by code");
  print("show    - Display all calculators");
  print("save    - Save list to Calculators.csv");
  print("exit    - Exit the application");
  print("-------------------------------------------");
}

void main() {
  ShopStore store = ShopStore();
  store.loadFromFile(); // bonus: reload previous session's data if present
  String command = "";

  do {
    menu();
    stdout.write("Enter command: ");
    String? input = stdin.readLineSync();
    if (input == null) {
      print("No more input. Exit.");
      break;
    }
    command = input.trim().toLowerCase();

    switch (command) {
      case "add":
        store.addNew();
        break;

      case "delete":
        stdout.write("Enter code to delete: ");
        String? codeInput = stdin.readLineSync();
        try {
          int code = int.parse(codeInput!);
          store.delete(code);
        } catch (_) {
          print("Code must be a valid integer.\n");
        }
        break;

      case "show":
        store.display();
        break;

      case "save":
        store.saveToFile();
        break;

      case "exit":
        print("Exit.");
        exit(0);

      default:
        print("Invalid command.\n");
    }
  } while (command != "exit");
}
