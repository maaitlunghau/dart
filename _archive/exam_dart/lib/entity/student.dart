class Student {
  String id;
  String name;
  double programmingScore;
  double databaseScore;
  double englishScore;

  Student(
    this.id,
    this.name,
    this.programmingScore,
    this.databaseScore,
    this.englishScore,
  );

  double getAverage() {
    return (programmingScore + databaseScore + englishScore) / 3;
  }

  String _classify() {
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

  @override
  String toString() {
    return "ID: $id\tName: $name\tAverage: ${getAverage().toStringAsFixed(2)}\tClassification: ${_classify()}";
  }
}
