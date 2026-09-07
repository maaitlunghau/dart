[English](README.md) | **Tiếng Việt**

# Dart Self-Study

Không gian tự học **Dart** một cách bài bản, với đích đến là học **Flutter** đúng nền tảng thay vì
chỉ ghép code cho chạy được.

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

### Giai đoạn 2 — Học nền tảng theo lộ trình (hiện tại)

- Mục tiêu: nắm Dart từ cơ bản đến đủ nâng cao, làm nền vững để vào Flutter.
- Cách làm: đi theo lộ trình đã vạch sẵn ở [`docs/ROADMAP.md`](docs/ROADMAP.md) — 21 chủ đề chia 4
  tier, học tuần tự, không nhảy cóc.
- Vai trò của AI: **hỗ trợ, không thay thế** — dùng để giải thích khái niệm, review code tự viết,
  gỡ lỗi. Code chính do mình viết, để thật sự cọ xát với ngôn ngữ.

---

## Cấu trúc repo

| Đường dẫn | Nội dung |
|---|---|
| [`docs/ROADMAP.md`](docs/ROADMAP.md) | Lộ trình học Dart chi tiết — 21 chủ đề, 4 tier, kèm mục tiêu và ứng dụng Flutter của từng mục |
| `_archive/` | Toàn bộ vật liệu giai đoạn 1, giữ nguyên trạng |
| `00_*/` … `20_*/` | Các thư mục thực hành theo roadmap — **tạo dần khi học tới**, chưa có sẵn |

---

## Lộ trình học

Chi tiết đầy đủ ở [`docs/ROADMAP.md`](docs/ROADMAP.md). Tóm tắt:

| Tier | Phạm vi | Nội dung chính |
|:---:|---|---|
| 0 | Nền tảng bắt buộc | Cú pháp, hàm & closure, null safety, OOP, kế thừa & interface, collection & Iterable, `==`/`hashCode` & bất biến |
| 1 | Cốt lõi hướng Flutter | `Future`/`async`, xử lý lỗi, cascade, extension, enum |
| 2 | Nâng cao | `Stream`, mixin, generics nâng cao, sealed class & pattern matching, JSON, cấu trúc dự án & testing |
| 3 | Optional | Isolates, async patterns nâng cao |

**Nguyên tắc:** xong hết một tier mới sang tier kế tiếp; một mục coi là xong khi tự giải thích lại
được bằng lời, không nhìn tài liệu.

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

**Cách dùng đúng:** đây là tài liệu tham chiếu về *pattern*, không phải chuẩn mực để học theo. Mục
`00_gap_check` trong roadmap dùng chính code này để chẩn đoán xem phần nào mình hiểu thật, phần nào
chỉ là nhìn AI viết.

Chạy thử một package (yêu cầu Dart SDK `^3.13.0`):

```bash
cd _archive/assignment_01
dart pub get
dart run bin/shop_app.dart
```

Phân tích tĩnh: `dart analyze`

---

## Quy ước commit

Một dòng duy nhất, tối đa 70 ký tự, không body, không trailer:

```
type(scope): subject
```

`type` thuộc: `feat` `fix` `docs` `style` `refactor` `perf` `test` `chore` `revert` `ci`.
Quy ước này được kiểm tra bằng Husky `commit-msg` hook cài ở máy local (không track trong repo).
