import 'package:student_manager/data/in_memory_student_repository.dart';
import 'package:student_manager/model/student.dart';
import 'package:student_manager/service/student_service.dart';

/// Tầng ngoài cùng: chỗ DUY NHẤT được chạm I/O (`print`, `stdin`, file...).
/// Giữ nó mỏng nhất có thể — chỉ nối dây và hiển thị.
/// Mọi thứ ở đây KHÔNG test được, nên ở đây càng ít logic càng tốt.
Future<void> main() async {
  final service = StudentService(InMemoryStudentRepository());

  await service.add(const Student(id: 'SV01', name: 'An', scores: [9, 8.5, 8]));
  await service.add(
    const Student(id: 'SV02', name: 'Bình', scores: [6, 7, 5.5]),
  );
  await service.add(
    const Student(id: 'SV03', name: 'Chi', scores: [4, 5, 4.5]),
  );

  print('--- bảng xếp hạng ---');
  for (final s in await service.ranked()) {
    print('$s · ${service.classify(s.average)}');
  }

  print('--- dữ liệu sai bị chặn ---');
  try {
    await service.add(const Student(id: 'SV04', name: 'Dũng', scores: [99]));
  } on InvalidStudentException catch (e) {
    print(e);
  }
}
