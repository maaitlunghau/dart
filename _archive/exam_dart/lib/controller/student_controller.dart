import 'dart:collection';

import '../entity/student.dart';
import '../service/student_service.dart';

class StudentController {
  HashMap<String, Student> studentMap = HashMap<String, Student>();

  void addStudent() {
    StudentService service = StudentService();
    service.input();

    if (service.id.isEmpty) {
      return;
    }

    if (studentMap.containsKey(service.id)) {
      print("Student ID '${service.id}' already exists!\n");
      return;
    }

    Student student = Student(
      service.id,
      service.name,
      service.programmingScore,
      service.databaseScore,
      service.englishScore,
    );

    studentMap[student.id] = student;
    print("Student added successfully.\n");
  }

  void findAll() {
    if (studentMap.isEmpty) {
      print("Student list is empty.\n");
      return;
    }

    print("---------------------------------------------");
    for (var student in studentMap.values) {
      print(student);
    }
    print("---------------------------------------------");
  }

  void calculateStatistics() {
    if (studentMap.isEmpty) {
      print("Student list is empty.\n");
      return;
    }

    double highest = studentMap.values.first.getAverage();
    double lowest = studentMap.values.first.getAverage();
    double total = 0;

    for (var student in studentMap.values) {
      double average = student.getAverage();

      if (average > highest) {
        highest = average;
      }
      if (average < lowest) {
        lowest = average;
      }

      total += average;
    }

    double overallAverage = total / studentMap.length;

    print("Number of students: ${studentMap.length}");
    print("Highest average: ${highest.toStringAsFixed(2)}");
    print("Lowest average: ${lowest.toStringAsFixed(2)}");
    print("Overall average: ${overallAverage.toStringAsFixed(2)}\n");
  }

  void classifyStudents() {
    if (studentMap.isEmpty) {
      print("Student list is empty.\n");
      return;
    }

    int excellent = 0;
    int good = 0;
    int average = 0;
    int poor = 0;

    for (var student in studentMap.values) {
      double score = student.getAverage();

      if (score >= 8.0) {
        excellent++;
      } else if (score >= 6.5) {
        good++;
      } else if (score >= 5.0) {
        average++;
      } else {
        poor++;
      }
    }

    print("Excellent: $excellent");
    print("Good: $good");
    print("Average: $average");
    print("Poor: $poor\n");
  }

  void findById(String id) {
    if (studentMap.containsKey(id)) {
      print(studentMap[id]);
    } else {
      print("Student with ID '$id' not found!\n");
    }
  }
}
