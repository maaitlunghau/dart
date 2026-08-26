import 'dart:io';
import 'package:demo_dart/io.controller/worker_controller.dart';

void main() {
  /* 1. Properties */
  WorkerController controller = WorkerController();
  String path = "bin/session05_file_io/worker.csv";
  int choice;

  /* 2. Menu */
  do {
    print("...............................");
    print("Worker Management System");
    print("1. Add new Worker");
    print("2. List of workers");
    print("3. Delete by id");
    print("4. Write to file");
    print("5. Read to file");
    print("6. Exit");
    print("...............................");

    stdout.write("Enter your choice:");
    choice = int.parse(stdin.readLineSync().toString());

    /* 3. Handle choice */
    switch (choice) {
      case 1:
        controller.saveWorker();
        break;

      case 2:
        controller.display();
        break;

      case 3:
        print("Enter worker id:");
        int id = int.parse(stdin.readLineSync().toString());
        controller.deleteById(id);
        break;

      case 4:
        controller.writeToFile(path);
        break;

      case 5:
        controller.readToFile(path);
        break;

      case 6:
        print("Goodbye!");
        exit(0);

      default:
        print("Invalid choice.");
    }
  } while (choice != 6);
}

//dart run /bin/session05_file_io/ex04_main.dart