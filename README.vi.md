[English](README.md) | **Tiếng Việt**

# Dart Self-Study

Không gian tự học **Dart** một cách bài bản, với đích đến là học **Flutter** đúng nền tảng thay vì
chỉ ghép code cho chạy được.

**Trạng thái: roadmap đã hoàn thành.** Đủ 21 mục, 27 file Dart, `dart analyze` sạch toàn repo.

Repo này đã đi qua hai giai đoạn khác hẳn nhau về mục tiêu lẫn cách học. Toàn bộ giai đoạn cũ được
giữ nguyên trong `_archive/` — không xoá, để làm mốc đối chiếu.

---

## Hai giai đoạn

### Giai đoạn 1 — Luyện thi theo pattern (đã khép lại → `_archive/`)

- Mục tiêu: học nhanh để làm bài thi thực hành theo đúng khuôn đề (một model OOP, một class quản lý
  dùng collection, đọc/ghi CSV, `main()` dạng menu `switch`, gói trong 60 phút).
- Cách làm: dựa nhiều vào AI để sinh code cho kịp deadline.
- Kết quả: bài chạy được, nhưng **kiến thức nền không đọng lại** — nhiều thứ trong code chưa thực sự
  hiểu tại sao lại viết như vậy.

### Giai đoạn 2 — Học nền tảng theo lộ trình

- Mục tiêu: nắm Dart từ cơ bản đến đủ nâng cao, làm nền vững để vào Flutter.
- Cách làm: đi theo lộ trình đã vạch sẵn ở [`docs/ROADMAP.md`](docs/ROADMAP.md) — 21 chủ đề chia 4
  tier, học tuần tự, không nhảy cóc. Mỗi mục đều có code chạy được, không chỉ ghi chú.
- Vai trò của AI: **tài liệu tham khảo, không phải người làm thay** — giải thích khái niệm, đề xuất
  code mẫu, review code, gỡ lỗi. AI **được phép** đưa ra code hoàn chỉnh để tham khảo; điều kiện là
  code đó phải do mình **tự gõ lại** vào file, và **giải thích lại được** từng dòng. Chép mà không
  hiểu thì mới là lặp lại sai lầm của giai đoạn 1 — ranh giới nằm ở chỗ hiểu, không nằm ở chỗ ai gõ
  ra trước.

Mở đầu bằng `00_gap_check` — hai bài trắc nghiệm tự chẩn đoán về chính code giai đoạn 1, làm mà
không mở lại code đó. Kết quả 42/51, lộ ra năm lỗ hổng thật; mỗi lỗ hổng giờ đều có code chạy được
để chứng minh cách đúng.

---

## Cấu trúc repo

| Đường dẫn | Nội dung |
|---|---|
| [`docs/ROADMAP.md`](docs/ROADMAP.md) | Lộ trình học chi tiết — 21 chủ đề, 4 tier, kèm ngày hoàn thành |
| `00_gap_check/` | Hai bài trắc nghiệm chẩn đoán, có đáp án và phần chấm chi tiết |
| `01_*/` … `20_*/` | Mỗi chủ đề một file chạy được (hai file ở nơi chủ đề đáng tách) |
| [`18_project_structure_and_testing/`](18_project_structure_and_testing/) | Package `student_manager` độc lập — template kiến trúc phân tầng + 9 unit test |
| `_archive/` | Toàn bộ vật liệu giai đoạn 1, giữ nguyên trạng |
| `pubspec.yaml` · `analysis_options.yaml` | Root repo là một package Dart; lint = `package:lints/recommended` + `prefer_single_quotes` |

---

## Chạy code

```bash
dart pub get

dart run 01_basic_syntax/variables.dart     # file của bất kỳ chủ đề nào
dart analyze                                # sạch toàn repo
dart format .
```

Template phân tầng ở mục 18 là package riêng, có test riêng:

```bash
cd 18_project_structure_and_testing
dart pub get
dart test          # 9 test xanh
dart run bin/app.dart
```

Yêu cầu Dart SDK `^3.13.0`.

---

## Lộ trình học

Chi tiết đầy đủ ở [`docs/ROADMAP.md`](docs/ROADMAP.md).

| Tier | Phạm vi | Nội dung |
|:---:|---|---|
| 0 | Nền tảng bắt buộc | Gap check, cú pháp, hàm & closure, null safety, OOP, kế thừa & interface, collection & `Iterable`, `==`/`hashCode` & bất biến |
| 1 | Cốt lõi hướng Flutter | `Future`/`async`, xử lý lỗi, cascade, extension, enum |
| 2 | Nâng cao | `Stream` & `StreamController`, mixin, generics, sealed class & pattern matching, JSON, cấu trúc dự án & testing |
| 3 | Optional | Isolates, async patterns nâng cao |

**Nguyên tắc:** xong hết một tier mới sang tier kế tiếp; một mục coi là xong khi tự giải thích lại
được bằng lời, không nhìn tài liệu.

Mọi file đều dựng theo cùng một khuôn — hàm nhỏ trả về giá trị, `main()` in ra để xem, và những đoạn
cố tình viết sai được comment lại kèm nguyên văn lời compiler. Mục đích là **nhìn thấy** hành vi,
không phải đọc mô tả về nó.

---

## `_archive/` — vật liệu giai đoạn 1

Bốn package Dart độc lập, mỗi package có `pubspec.yaml` riêng:

| Package | Nội dung | Entry point |
|---|---|---|
| `standard_demo_dart/` | Bài tập theo buổi học: `session03_oop`, `session04_inheritance`, `session05_file_io` | từng file `bin/sessionXX_*/exYY_*.dart` |
| `assignment_01/` | Quản lý văn phòng phẩm — `Calculator extends Stationery`, `ShopStore` dùng `Map<int, Calculator>`, ghi `Calculators.csv` | `bin/shop_app.dart` |
| `assignment_02/` | Quản lý tài khoản ngân hàng — `ATM extends Bank`, dùng `HashSet<Account>`, ghi `bank.csv` | `bin/test_account.dart` |
| `exam_dart/` | Bài thi thật — chia tầng `entity` / `repository` / `service` / `controller` | `bin/student_test.dart` |
| `archive_docs/` | Đề bài gốc (PDF) và ảnh đề thi | — |

**Cách dùng đúng:** đây là tài liệu tham chiếu về *pattern*, không phải chuẩn mực để học theo. Nó
được loại khỏi cấu hình analyzer ở root và không bao giờ bị sửa.

Nhiều chủ đề dùng nó làm đối chứng — mục 07 dựng lại `HashSet<Account>` không loại được trùng, mục
09 dựng lại `on IOException` bỏ sót `FormatException`, và README của mục 18 so trực tiếp cách phân
tầng của mình với `exam_dart`.

---

## Quy ước commit

Một dòng duy nhất, tối đa 70 ký tự, không body, không trailer:

```
type(scope): subject
```

`type` thuộc: `feat` `fix` `docs` `style` `refactor` `perf` `test` `chore` `revert` `ci`.
Quy ước này được kiểm tra bằng Husky `commit-msg` hook cài ở máy local (không track trong repo).
