# Template cấu trúc project Dart

Package Dart độc lập, dùng làm **khuôn để copy** khi bắt đầu project mới.
Code tối thiểu — trọng tâm là cách chia tầng và vì sao chia như vậy.

```bash
cd 18_project_structure_and_testing
dart pub get
dart run bin/app.dart
dart test
dart analyze
dart format .
```

---

## Cấu trúc

```
18_project_structure_and_testing/
├─ pubspec.yaml                              khai báo package + dependency
├─ analysis_options.yaml                     mức nghiêm khắc của lint
├─ lib/
│  ├─ model/student.dart                     dữ liệu thuần
│  ├─ repository/student_repository.dart     hợp đồng lưu trữ (abstract)
│  ├─ data/in_memory_student_repository.dart một cài đặt cụ thể
│  └─ service/student_service.dart           logic nghiệp vụ
├─ bin/app.dart                              entry point — chỗ DUY NHẤT có I/O
└─ test/student_service_test.dart            unit test
```

## Luật phụ thuộc — một chiều

```
bin/app.dart  ──►  service  ──►  repository (abstract)  ◄──  data
                      │                                       
                      └──────────►  model  ◄──────────────────┘
```

| Tầng | Được biết | Không được biết |
|---|---|---|
| `model` | không gì cả | mọi tầng khác |
| `repository` | `model` | `service`, `data`, I/O |
| `data` | `model`, `repository` | `service` |
| `service` | `model`, `repository` | `data` cụ thể, **I/O** |
| `bin` | tất cả | — |

Mũi tên **không bao giờ đi ngược**. `model` không import gì, `service` không
import `data`, và không tầng nào trong `lib/` được gọi `print` hay `stdin`.

## Vì sao chia tầng — lý do thật

Không phải để code "trông chuyên nghiệp". Lý do là **test được**:

```dart
// test/ — thay repository thật bằng bản in-memory, không cần DB
service = StudentService(InMemoryStudentRepository());
expect(await service.ranked(), hasLength(1));
```

`StudentService` nhận repository qua **constructor**, và không biết `stdin`
tồn tại. Hai điều đó cộng lại làm nó test được bằng unit test thường.

Ngược lại `bin/app.dart` **không** test được — nên ở đó càng ít logic càng tốt.
Nó chỉ nối dây và in ra.

## Đối chiếu với `_archive/exam_dart`

| | `exam_dart` | template này |
|---|---|---|
| Có phân tầng | ✅ entity/repository/service/controller | ✅ model/repository/data/service |
| Service có gọi `stdin` | **có** | không |
| Test được logic | **không** — phải giả lập bàn phím | có |
| `test/` | file mặc định, rỗng | 9 test thật |

`exam_dart` chia tầng đúng hình thức nhưng `StudentService` vẫn gọi
`stdin.readLineSync()` bên trong, nên vẫn không test được. **Chia tầng mà
service còn dính I/O thì chia cũng vô nghĩa.**

## Ghi chú khi copy sang project mới

- Đổi `name:` trong `pubspec.yaml`, rồi đổi luôn mọi `package:student_manager/…`
- `lib/` là nơi duy nhất `package:` trỏ tới — file ngoài `lib/` không import
  bằng `package:` được
- Với Flutter: thêm `widget/` hoặc `presentation/` ngang hàng `service`,
  luật phụ thuộc giữ nguyên
- `.dart_tool/` không commit; `pubspec.lock` thì có
