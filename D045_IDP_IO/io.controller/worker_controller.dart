import 'dart:convert';
import 'dart:io';

import '../io.model/worker.dart';

/* 1. Worker Controller */
class WorkerController {
  /* 1.1. Properties
		Uses Map Literal '{}' - Built-in, no import required
   */
  Map<int, Worker> list = {};

  /* 1.2. Constructor */
  WorkerController();

  /* 2. Add new Worker */
  void saveWorker() {
    Worker worker = Worker();

    stdout.write("Enter id:");
    worker.id = int.parse(stdin.readLineSync()!);

    stdout.write("Enter name:");
    worker.name = stdin.readLineSync()!;

    stdout.write("Enter work day:");
    worker.workdays = int.parse(stdin.readLineSync()!);

    stdout.write("Enter rent per day:");
    worker.perRentDay = double.parse(stdin.readLineSync()!);

    // list.putIfAbsent(worker.id, () => worker);
	list[worker.id] = worker;
  }

  /* 3. List of workers */
  void display() {
    print("Worker List");

    for (var worker in list.values) {
      print(worker.output());
    }
  }

  /* 4. Delete Worker */
  void deleteById(int id) {
    if (list.containsKey(id)) {
      list.remove(id);
      print("Delete worker $id completed.");
    }
  }

  /* 5. Write to file */
  void writeToFile(String path) {
    try {
      File file = File(path);

      file.writeAsStringSync(
        "Today's: ${DateTime.now()}\n",
        mode: FileMode.append,
      );

      for (var worker in list.values) {
        file.writeAsStringSync("${worker.output()}\n", mode: FileMode.append);
      }

      print("Write to file completed.");
    } on IOException catch (e) {
      print(e);
    }
  }

  /* 6. Read from file */
  void readToFile(String path) {
    try {
      File file = File(path);

      List<String> lines = file.readAsLinesSync(encoding: ascii);

      for (var line in lines) {
        print(line);
      }
    } on IOException catch (e) {
      print(e);
    }
  }
}

/*
  Dart Import

    Cách 1 – Relative import
    import '../io.model/worker.dart';

    Cách 2 – Package import
    import 'package:wrkshp_idp/io.model/worker.dart';

    Cả hai đều hợp lệ.

    Relative import
    → Đường dẫn tính từ file hiện tại.
    → Gần với cách viết đường dẫn trong HTML.
    → VS Code hỗ trợ gợi ý đường dẫn.

    Package import
    → Đường dẫn tính từ package.
    → Ổn định hơn khi project lớn hoặc thay đổi cấu trúc thư mục.

    Workshop
    → SV có thể tự chọn.
    → Quan trọng là hiểu cách hoạt động.
*/
