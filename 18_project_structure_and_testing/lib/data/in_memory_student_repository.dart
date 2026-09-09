import 'package:student_manager/model/student.dart';
import 'package:student_manager/repository/student_repository.dart';

/// Tầng DATA: một cài đặt cụ thể của repository.
/// Đổi sang SQLite hay REST API chỉ cần viết class khác implement cùng
/// interface — service không phải sửa dòng nào.
class InMemoryStudentRepository implements StudentRepository {
  final Map<String, Student> _store = {};

  @override
  Future<List<Student>> findAll() async => _store.values.toList();

  @override
  Future<Student?> findById(String id) async => _store[id];

  @override
  Future<void> save(Student student) async => _store[student.id] = student;
}
