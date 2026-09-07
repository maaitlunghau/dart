import 'dart:io';

import '../repository/student_repository.dart';

class StudentService implements StudentRepository {
  String id = "";
  String name = "";
  double programmingScore = 0;
  double databaseScore = 0;
  double englishScore = 0;

  @override
  void input() {
    // id: not empty
    while (true) {
      stdout.write("Enter id: ");
      String? value = stdin.readLineSync();

      if (value == null) {
        print("No more input. Cancelling input.\n");
        return;
      }
      if (value.trim().isEmpty) {
        print("ID is required.");
        continue;
      }

      id = value.trim();
      break;
    }

    // name: not empty
    while (true) {
      stdout.write("Enter name: ");
      String? value = stdin.readLineSync();

      if (value == null) {
        print("No more input. Cancelling input.\n");
        return;
      }
      if (value.trim().isEmpty) {
        print("Name is required.");
        continue;
      }

      name = value.trim();
      break;
    }

    // programmingScore: 0-10
    while (true) {
      stdout.write("Enter programming score: ");
      String? value = stdin.readLineSync();

      if (value == null) {
        print("No more input. Cancelling input.\n");
        return;
      }

      try {
        double score = double.parse(value);
        if (score < 0 || score > 10) {
          print("Programming score must be between 0 and 10.");
          continue;
        }

        programmingScore = score;
        break;
      } catch (_) {
        print("Programming score must be a numeric value.");
      }
    }

    // databaseScore: 0-10
    while (true) {
      stdout.write("Enter database score: ");
      String? value = stdin.readLineSync();

      if (value == null) {
        print("No more input. Cancelling input.\n");
        return;
      }

      try {
        double score = double.parse(value);

        if (score < 0 || score > 10) {
          print("Database score must be between 0 and 10.");
          continue;
        }

        databaseScore = score;
        break;
      } catch (_) {
        print("Database score must be a numeric value.");
      }
    }

    // englishScore: 0-10
    while (true) {
      stdout.write("Enter english score: ");
      String? value = stdin.readLineSync();

      if (value == null) {
        print("No more input. Cancelling input.\n");
        return;
      }

      try {
        double score = double.parse(value);

        if (score < 0 || score > 10) {
          print("English score must be between 0 and 10.");
          continue;
        }

        englishScore = score;
        break;
      } catch (_) {
        print("English score must be a numeric value.");
      }
    }
  }

  @override
  double getAverage() {
    return (programmingScore + databaseScore + englishScore) / 3;
  }

  @override
  String classify() {
    double average = getAverage();

    if (average >= 8.0) {
      return "Excellent";
    } else if (average >= 6.5) {
      return "Good";
    } else if (average >= 5.0) {
      return "Average";
    }

    return "Poor";
  }
}
