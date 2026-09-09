import 'package:student_manager/model/student.dart';

/// Tầng REPOSITORY: chỉ khai HỢP ĐỒNG lưu trữ, không nói lưu ở đâu.
/// Nhờ nó, service không dính vào DB/file/API cụ thể — và test thay được
/// bằng một bản giả lập.
abstract class StudentRepository {
  Future<List<Student>> findAll();

  Future<Student?> findById(String id);

  Future<void> save(Student student);
}
