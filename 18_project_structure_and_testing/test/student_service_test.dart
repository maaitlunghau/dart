import 'package:student_manager/data/in_memory_student_repository.dart';
import 'package:student_manager/model/student.dart';
import 'package:student_manager/service/student_service.dart';
import 'package:test/test.dart';

/// Test được vì `StudentService` không dính `stdin`/`print`.
/// Repository thật thay bằng bản in-memory — không cần DB, không cần mạng.
void main() {
  late StudentService service;

  // `setUp` chạy lại TRƯỚC MỖI test -> mỗi test bắt đầu từ trạng thái sạch.
  setUp(() {
    service = StudentService(InMemoryStudentRepository());
  });

  group('Student', () {
    test('average tính đúng', () {
      const s = Student(id: 'A', name: 'An', scores: [8, 9, 10]);
      expect(s.average, 9);
    });

    test('scores rỗng thì average = 0, không chia cho 0', () {
      const s = Student(id: 'A', name: 'An', scores: []);
      expect(s.average, 0);
    });

    test('so sánh theo id, không theo tham chiếu', () {
      const a = Student(id: 'A', name: 'An', scores: []);
      const b = Student(id: 'A', name: 'Khác', scores: [5]);
      expect(a, b);
      expect({a, b}.length, 1);
    });
  });

  group('StudentService.add', () {
    test('lưu được sinh viên hợp lệ', () async {
      await service.add(const Student(id: 'A', name: 'An', scores: [7]));
      expect(await service.ranked(), hasLength(1));
    });

    test('id rỗng bị từ chối', () {
      expect(
        () => service.add(const Student(id: '  ', name: 'An', scores: [7])),
        throwsA(isA<InvalidStudentException>()),
      );
    });

    test('điểm ngoài 0..10 bị từ chối', () {
      expect(
        () => service.add(const Student(id: 'A', name: 'An', scores: [11])),
        throwsA(isA<InvalidStudentException>()),
      );
    });
  });

  group('StudentService.ranked', () {
    test('sắp theo điểm trung bình giảm dần', () async {
      await service.add(const Student(id: 'A', name: 'An', scores: [5]));
      await service.add(const Student(id: 'B', name: 'Bình', scores: [9]));
      await service.add(const Student(id: 'C', name: 'Chi', scores: [7]));

      final ids = (await service.ranked()).map((s) => s.id).toList();
      expect(ids, ['B', 'C', 'A']);
    });

    test('không có ai thì trả list rỗng', () async {
      expect(await service.ranked(), isEmpty);
    });
  });

  group('StudentService.classify', () {
    test('phủ hết các mốc', () {
      expect(service.classify(9), 'Giỏi');
      expect(service.classify(8), 'Giỏi');
      expect(service.classify(7), 'Khá');
      expect(service.classify(5), 'Trung bình');
      expect(service.classify(4.9), 'Yếu');
    });
  });
}
