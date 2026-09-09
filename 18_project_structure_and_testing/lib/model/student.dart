/// Tầng MODEL: dữ liệu thuần.
/// - không I/O, không phụ thuộc tầng nào khác
/// - bất biến: mọi field `final`, sửa thì dùng `copyWith`
class Student {
  final String id;
  final String name;
  final List<double> scores;

  const Student({required this.id, required this.name, required this.scores});

  double get average =>
      scores.isEmpty ? 0 : scores.reduce((a, b) => a + b) / scores.length;

  Student copyWith({String? name, List<double>? scores}) =>
      Student(id: id, name: name ?? this.name, scores: scores ?? this.scores);

  @override
  bool operator ==(Object other) => other is Student && other.id == id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => '$id · $name · ${average.toStringAsFixed(2)}';
}
