import 'dart:io';

import '../model/calculator.dart';

/* R3: ShopStore manages a collection of Calculator */
class ShopStore {
  // 1. Generic Map<code, Calculator>
  Map<int, Calculator> list = {};

  // 2. Add new Calculator (loop + try until valid)
  void addNew() {
    Calculator calculator = Calculator();

    // code
    while (true) {
      stdout.write("Enter code: ");
      String? input = stdin.readLineSync();
      if (input == null) {
        print("No more input. Cancelling add.\n");
        return;
      }
      try {
        int code = int.parse(input);
        if (list.containsKey(code)) {
          print("This code already exists!");
          continue;
        }
        calculator.code = code;
        break;
      } catch (_) {
        print("Code must be a valid integer.");
      }
    }

    // model
    while (true) {
      stdout.write("Enter model: ");
      String? input = stdin.readLineSync();
      if (input == null) {
        print("No more input. Cancelling add.\n");
        return;
      }
      try {
        calculator.model = input;
        break;
      } catch (e) {
        print(e);
      }
    }

    // price
    while (true) {
      stdout.write("Enter price: ");
      String? input = stdin.readLineSync();
      if (input == null) {
        print("No more input. Cancelling add.\n");
        return;
      }
      try {
        calculator.price = double.parse(input);
        break;
      } catch (e) {
        print(e);
      }
    }

    // qty
    while (true) {
      stdout.write("Enter qty: ");
      String? input = stdin.readLineSync();
      if (input == null) {
        print("No more input. Cancelling add.\n");
        return;
      }
      try {
        calculator.qty = int.parse(input);
        break;
      } catch (e) {
        print(e);
      }
    }

    list[calculator.code] = calculator;
    print("Added successfully.\n");
  }

  // 3. Display all calculators
  void display() {
    if (list.isEmpty) {
      print("List is empty.\n");
      return;
    }
    print("---------------------------------------------");
    for (var calculator in list.values) {
      calculator.exportData();
    }
    print("---------------------------------------------");
  }

  // 4. Delete by code
  void delete(int code) {
    if (list.containsKey(code)) {
      list.remove(code);
      print("Deleted calculator with code $code.\n");
    } else {
      print("Calculator with code $code not found!\n");
    }
  }

  // 5. Save list to Calculators.csv (each Calculator on a new line)
  void saveToFile() {
    try {
      File file = File("Calculators.csv");
      StringBuffer buffer = StringBuffer();

      for (var calculator in list.values) {
        buffer.writeln(calculator.toCsv());
      }

      file.writeAsStringSync(buffer.toString());
      print("Saved to Calculators.csv\n");
    } on IOException catch (e) {
      print(e);
    }
  }

  // 6. Bonus (not required by the assignment): reload list from Calculators.csv
  void loadFromFile() {
    File file = File("Calculators.csv");
    if (!file.existsSync()) {
      return;
    }

    try {
      List<String> lines = file.readAsLinesSync();

      for (var line in lines) {
        if (line.trim().isEmpty) {
          continue;
        }

        List<String> parts = line.split(",");
        Calculator calculator = Calculator();
        calculator.code = int.parse(parts[0]);
        calculator.model = parts[1];
        calculator.price = double.parse(parts[2]);
        calculator.qty = int.parse(parts[3]);

        list[calculator.code] = calculator;
      }

      print("Loaded ${list.length} calculator(s) from Calculators.csv\n");
    } on IOException catch (e) {
      print(e);
    }
  }
}
