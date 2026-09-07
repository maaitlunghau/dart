import 'dart:io';

import 'package:exam_dart/controller/student_controller.dart';

void menu() {
  print("------------- STUDENT MANAGEMENT -------------");
  print("1. Add new Student");
  print("2. List of Students");
  print("3. Calculate Statistics");
  print("4. Classify Students");
  print("5. Search by Student ID");
  print("6. Exit");
  print("-----------------------------------------------");
}

void main() {
  StudentController controller = StudentController();
  int? option;

  do {
    menu();

    stdout.write("Enter your choice [1-6]: ");
    String? input = stdin.readLineSync();

    if (input == null) {
      print("No more input. Exit.");
      break;
    }

    option = int.tryParse(input);

    switch (option) {
      case 1:
        controller.addStudent();
        break;

      case 2:
        controller.findAll();
        break;

      case 3:
        controller.calculateStatistics();
        break;

      case 4:
        controller.classifyStudents();
        break;

      case 5:
        stdout.write("Enter student ID: ");
        String? id = stdin.readLineSync();

        if (id == null) {
          print("No more input.\n");
          break;
        }

        controller.findById(id);
        break;

      case 6:
        print("Goodbye!");
        exit(0);

      default:
        print("Your choice is incorrect!\n");
    }
  } while (option != 6);
}
