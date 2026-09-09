import 'package:student_manager/model/student.dart';
import 'package:student_manager/repository/student_repository.dart';

/// Exception riêng: nói rõ chuyện gì sai, hơn `Exception('...')` chung chung.
class InvalidStudentException implements Exception {
  final String reason;

  InvalidStudentException(this.reason);

  @override
  String toString() => 'InvalidStudentException: $reason';
}

/// Tầng SERVICE: toàn bộ logic nghiệp vụ.
/// KHÔNG biết `stdin`/`print` là gì -> nhờ vậy test được bằng unit test thường.
/// Repository nhận qua constructor để test thay được bản giả lập.
class StudentService {
  final StudentRepository _repository;

  StudentService(this._repository);

  /// Kiểm tra rồi mới lưu. Dữ liệu sai thì ném exception, không tự ý sửa.
  Future<void> add(Student student) async {
    if (student.id.trim().isEmpty) {
      throw InvalidStudentException('id không được rỗng');
    }
    if (student.scores.any((s) => s < 0 || s > 10)) {
      throw InvalidStudentException('điểm phải nằm trong 0..10');
    }
    await _repository.save(student);
  }

  /// Xếp hạng theo điểm trung bình, cao xuống thấp.
  Future<List<Student>> ranked() async {
    final all = await _repository.findAll();
    return [...all]..sort((a, b) => b.average.compareTo(a.average));
  }

  String classify(double average) => switch (average) {
    >= 8.0 => 'Giỏi',
    >= 6.5 => 'Khá',
    >= 5.0 => 'Trung bình',
    _ => 'Yếu',
  };
}
