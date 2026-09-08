# 00.2 — Trắc nghiệm: nền tảng Dart

26 câu về kiến thức căn bản, **không** dựa vào code trong `_archive/`. Mục đích kép: ôn lại nền và đo trước xem module nào trong roadmap sẽ nặng với bạn.

Câu hỏi được nhóm theo đúng số mục trong `docs/ROADMAP.md`, nên kết quả đọc thẳng ra thành kế hoạch học: nhóm nào sai nhiều thì mục đó cần đi chậm.

**Luật:** giống file 01 — không tra cứu, đoán thì ghi `Đoán`, dòng `Vì sao` bắt buộc điền.

**Bắt đầu:** ___ **Xong:** ___

---

# TIER 0

## Mục 01 — Cú pháp nền

### 1. Khai báo nào **không** hợp lệ?

- [ ] A. `final now = DateTime.now();`
- [X] B. `const now = DateTime.now();`
- [ ] C. `const pi = 3.14;`
- [ ] D. `final names = <String>[];`

`Tự tin:` Chắc · `Vì sao: Bởi vì giá trị DateTime.now() chỉ lấy được giá trị trong lúc RunTime (đang chạy), trong khi từ khoá const bắt buộc giá trị phải cố định và biết trước trong lúc Complie (biên dịch) `

### 2. Khác biệt cốt lõi giữa `final` và `const` là gì?

- [ ] A. `const` nhanh hơn khi chạy
- [X] B. `final` gán một lần lúc **chạy**; `const` phải biết giá trị ngay lúc **biên dịch**
- [ ] C. `final` chỉ dùng cho field, `const` chỉ dùng cho biến cục bộ
- [ ] D. Không khác gì, chọn cái nào cũng được

`Tự tin:` Chắc

### 3. Đoạn nào gây lỗi?

- [ ] A. `num n = 5;`
- [ ] B. `double d = 5;`
- [X] C. `int a = 5; double b = a;`
- [ ] D. `num x = 5.0; `

`Tự tin:` Chắc · `Vì sao: Do a đang là kiểu int, ko thể gán giá trị cho b (kiểu double)`

### 4. Trong Dart 3, đoạn này hợp lệ không?

```dart
final label = switch (code) {
  1 => 'Một',
  2 => 'Hai',
  _ => 'Khác',
};
```

- [ ] A. Không — `switch` chỉ là câu lệnh, không trả được giá trị
- [X] B. Có — Dart 3 cho phép `switch` ở dạng **biểu thức**
- [ ] C. Có, nhưng phải bỏ dấu `;` cuối
- [ ] D. Không — thiếu `break` trong mỗi nhánh

`Tự tin:` Chắc

---

## Mục 02 — Hàm và closure

### 5. `void greet({required String name, int age = 0})` — cách gọi nào đúng?

- [X] A. `greet('An', 20);` — ❌ **BẠN CHỌN · SAI**
- [ ] B. `greet(name: 'An');` — ✅ **ĐÁP ÁN ĐÚNG**
- [ ] C. `greet(age: 20);`
- [ ] D. `greet();`

`Tự tin:` Chắc 

> ❌ **Sai ở đâu:** dấu `{ }` trong chữ ký `greet({required String name, int age = 0})` biến chúng thành **named parameter** — **bắt buộc** gọi kèm tên. Compiler báo 2 lỗi cùng lúc:
> ```
> error - The named parameter 'name' is required, but there's no corresponding argument.
> error - Too many positional arguments: 0 expected, but 2 found.
> ```
>
> Vì sao B đúng mà C, D sai: `name` có `required` nên không được thiếu; `age` có giá trị mặc định `0` nên bỏ qua được.
>
> **Ghi nhớ:** `{ }` = gọi bằng tên · `[ ]` = optional positional · không dấu gì = positional bắt buộc.
>
> 👉 **Cực kỳ quan trọng cho Flutter.** Mọi widget đều là named parameter: `Container(width: 100, height: 50, child: ...)`. Không nắm mục này thì đọc code Flutter sẽ thấy như cú pháp lạ. Học ở **mục 02**.

### 6. `int double(int x) => x * 2;` — dấu `=>` nghĩa là gì?

- [ ] A. Hàm bất đồng bộ
- [X] B. Viết tắt của `{ return x * 2; }` cho hàm chỉ có một biểu thức
- [ ] C. Toán tử so sánh lớn hơn hoặc bằng
- [ ] D. Khai báo hàm generic

`Tự tin:` Chắc

### 7. Hàm này in ra gì?

```dart
Function makeCounter() {
  int count = 0;
  return () => ++count;
}

final c = makeCounter();
print(c()); print(c()); print(c());
```

- [ ] A. `1 1 1`
- [ ] B. `0 1 2`
- [X] C. `1 2 3`
- [ ] D. Lỗi — `count` đã bị huỷ khi `makeCounter()` kết thúc

`Tự tin:` Chắc

---

## Mục 03 — Null safety

### 8. `String? name;` khác `String name;` ở chỗ nào?

- [ ] A. `String?` tốn ít bộ nhớ hơn
- [X] B. `String?` được phép mang giá trị `null`, `String` thì không
- [ ] C. `String?` là kiểu động
- [ ] D. Không khác, `?` chỉ là chú thích cho người đọc

`Tự tin:` Chắc 

### 9. `final len = name?.length ?? 0;` với `String? name`. Nếu `name` là `null` thì `len` bằng bao nhiêu?

- [ ] A. `null`
- [ ] B. Ném lỗi
- [X] C. `0`
- [ ] D. `-1`

`Tự tin:` Chắc

### 10. Vì sao dùng `!` bừa bãi (ví dụ `name!.length`) bị coi là mầm crash?

- [ ] A. `!` làm chương trình chạy chậm
- [X] B. `!` khẳng định với compiler "chắc chắn không null" — nếu thực tế là null thì ném lỗi lúc chạy
- [ ] C. `!` chuyển biến sang kiểu `dynamic`
- [ ] D. `!` chỉ dùng được trong hàm `async`

`Tự tin:` Chắc

### 11. `late String token;` dùng hợp lý nhất khi nào?

- [X] A. Khi muốn biến có giá trị mặc định là `null` — ❌ **BẠN CHỌN · SAI**
- [ ] B. Khi biến chắc chắn được gán trước lúc đọc, nhưng chưa gán được ngay lúc khai báo — ✅ **ĐÁP ÁN ĐÚNG**
- [ ] C. Khi muốn tắt kiểm tra null safety cho biến đó
- [ ] D. Khi biến sẽ không bao giờ đổi giá trị

`Tự tin:` Chắc

> ❌ **Sai ở đâu:** `late String token` **không phải** nullable. Muốn chứa `null` thì phải khai `String? token`. Hai thứ hoàn toàn khác nhau.
>
> `late` = lời hứa với compiler: *"tôi chưa gán được ngay, nhưng chắc chắn gán trước khi đọc"*. Compiler chấp nhận, và dời việc kiểm tra từ lúc biên dịch sang lúc chạy:
> ```
> error - The late local variable 'token' is definitely unassigned at this point.
> ```
>
> **Ghi nhớ:** `?` = *được phép null* · `late` = *chưa có giá trị, nhưng sẽ có, và tôi chịu trách nhiệm*.
>
> 👉 Bạn đã trả lời **đúng** file 01 câu 21 (đọc `late` trước khi gán → lỗi lúc chạy). Tức là bạn nắm **hậu quả** nhưng chưa nắm **mục đích**. Vá ở **mục 03**.

---

## Mục 04 — OOP cơ bản

### 12. Khi nào **bắt buộc** phải dùng `factory` constructor thay vì constructor thường?

- [ ] A. Khi class có nhiều hơn 3 field
- [X] B. Khi cần trả về một instance đã tồn tại sẵn, hoặc quyết định kiểu trả về lúc chạy
- [ ] C. Khi class là abstract
- [ ] D. Khi constructor có tham số optional

`Tự tin:` Chắc

### 13. Initializer list — phần sau dấu `:` trong `Person(this.name) : assert(name != '')` — chạy vào lúc nào?

- [ ] A. Sau khi thân constructor chạy xong
- [X] B. **Trước** thân constructor
- [ ] C. Chỉ chạy ở chế độ debug
- [ ] D. Song song với thân constructor

`Tự tin:` Đoán

### 14. Field private `_secret` khai trong `lib/model/user.dart`. Class khác nằm trong `lib/service/auth.dart` có đọc được `_secret` không?

- [ ] A. Được, vì cùng package
- [ ] B. Được, nếu cùng thư mục `lib/`
- [X] C. Không — `_` giới hạn theo **file**
- [ ] D. Được, nếu class đó `extends User`

`Tự tin:` Chắc

---

## Mục 05 — Kế thừa và interface

### 15. Một class có thể `extends` mấy class, và `implements` mấy interface?

- [ ] A. `extends` nhiều, `implements` một
- [ ] B. Cả hai đều chỉ được một
- [X] C. `extends` một, `implements` nhiều
- [ ] D. Cả hai đều không giới hạn

`Tự tin:` Chắc · `Vì sao: Trong Dart, một Class chỉ có thể extends duy nhất 1 class (vì Dart là một ngôn ngữ kế thừa - Single Inheritance. Và implements có thể implement nhiều interface/class cùng lúc, cùng nhau bởi dấu phẩy) `

### 16. Đa hình (polymorphism) trong Dart nghĩa là gì?

- [ ] A. Một class có nhiều constructor khác nhau
- [X] B. Một hàm nhận kiểu cha nhưng chạy ra hành vi của object con thật sự đang được truyền vào
- [ ] C. Một biến đổi kiểu được lúc chạy
- [ ] D. Nhiều class cùng tên trong các file khác nhau

`Tự tin:` Chắc · `Vì sao: Kiến thức cốt lõi của OOP`

---

## Mục 06 — Collection và Iterable

### 17. Cần lưu danh sách user, tra cứu thật nhanh theo `id`, và không cho trùng `id`. Chọn gì?

- [ ] A. `List<User>`
- [ ] B. `Set<User>`
- [X] C. `Map<String, User>` với khoá là `id`
- [ ] D. `List<Map<String, dynamic>>`

`Tự tin:` Chắc

### 18. Đoạn này in ra gì?

```dart
final nums = [1, 2, 3];
final result = nums.map((n) { print('xử lý $n'); return n * 2; });
print('xong tạo map');
```

- [ ] A. `xử lý 1` `xử lý 2` `xử lý 3` rồi `xong tạo map`
- [ ] B. Chỉ `xong tạo map` — `map` là lazy, chưa chạy gì cả — ✅ **ĐÁP ÁN ĐÚNG**
- [X] C. `xong tạo map` rồi `xử lý 1` `xử lý 2` `xử lý 3` — ❌ **BẠN CHỌN · SAI**
- [ ] D. Lỗi — thiếu `.toList()`

`Tự tin:` Chắc · `Vì sao: Vì trong Dart, có tính chất Lazy Evaluation trong .map().`

> ⚠️ **Gọi đúng tên khái niệm, nhưng suy ra sai kết luận.** Bạn viết "Lazy Evaluation" — chính xác. Nhưng lazy **không** có nghĩa là "chạy sau", mà là **không chạy cho tới khi có người tiêu thụ**.
>
> Trong đoạn code đó, `result` không bao giờ được duyệt — không `toList()`, không `for-in`, không gì cả. Nên hàm bên trong `map` **không chạy lần nào**. Chạy thật:
> ```
> $ dart run c.dart
> xong tao map          ← chỉ đúng một dòng này
> ```
>
> **Ghi nhớ:** `map`/`where` chỉ **mô tả** phép biến đổi. Phải có `toList()`, `toSet()`, `for-in` hoặc `first` thì nó mới thật sự chạy.
>
> 👉 Đây là lý do `.toList()` xuất hiện khắp code Flutter: `items.map((e) => ItemTile(e)).toList()`. Bỏ `.toList()` là danh sách widget rỗng. Học ở **mục 06**.

### 19. `final items = [1, 2, if (isVip) 99, ...extras];` — cú pháp này gọi là gì?

- [ ] A. Không hợp lệ trong Dart
- [X] B. Collection-if và spread operator
- [ ] C. Pattern matching
- [ ] D. Cascade notation

`Tự tin:` Đoán

---

## Mục 07 — Đẳng thức và bất biến

### 20. Override `operator ==` mà **quên** override `hashCode` thì hậu quả là gì?

- [ ] A. Lỗi biên dịch ngay
- [ ] B. `==` không hoạt động
- [X] C. `==` chạy đúng, nhưng `Set` và `Map` cư xử sai một cách âm thầm
- [ ] D. Không sao cả, `hashCode` tự suy ra từ `==`

`Tự tin:` Đoán 

### 21. Để viết được `const Point(1, 2)`, class `Point` phải thoả điều kiện gì?

- [X] A. Toàn bộ field là `final` và constructor khai báo `const`
- [ ] B. Class phải `extends Object`
- [ ] C. Class không được có method
- [ ] D. Chỉ cần thêm `const` lúc gọi, class không cần gì

`Tự tin:` Đoán

### 22. `copyWith` tồn tại để làm gì?

- [ ] A. Sao chép object sang một biến khác cho nhanh
- [X] B. Tạo bản mới có sửa vài field, vì object bất biến không sửa tại chỗ được
- [ ] C. So sánh hai object với nhau
- [ ] D. Chuyển object thành JSON

`Tự tin:` Đoán

---

# TIER 1

## Mục 08 — Future, async/await

### 23. Câu nào **đúng** về `await`?

- [ ] A. `await` chặn toàn bộ chương trình cho tới khi có kết quả
- [ ] B. `await` tạo một luồng (thread) mới
- [X] C. `await` nhường quyền cho việc khác chạy tiếp, rồi quay lại khi có kết quả
- [ ] D. `await` chỉ dùng được ở hàm `main()`

`Tự tin:` Chắc · `Vì sao: Tính chất cốt lõi của async/await`

### 24. Gọi một hàm `Future<void> save()` mà **quên** `await`, và bên trong nó ném lỗi. Chuyện gì xảy ra?

- [ ] A. Lỗi nổi lên đúng chỗ gọi, `try/catch` quanh đó bắt được
- [X] B. Lỗi không nổi lên chỗ gọi — `try/catch` quanh đó không bắt được
- [ ] C. Lỗi bị nuốt hoàn toàn, không bao giờ xuất hiện
- [ ] D. Lỗi biên dịch, không chạy được

`Tự tin:` Chắc

---

## Mục 09 — Xử lý lỗi

### 25. `Exception` và `Error` khác nhau thế nào về mặt ý định?

- [X] A. `Exception` = lỗi dự kiến nên xử lý; `Error` = lỗi lập trình, không nên bắt mà nên sửa code
- [ ] B. `Error` nghiêm trọng hơn nên phải bắt kỹ hơn
- [ ] C. Hai cái như nhau, chỉ khác tên
- [ ] D. `Exception` chỉ dùng trong `async`, `Error` dùng trong code đồng bộ

`Tự tin:` Chắc

---

## Mục 10–12 — Cascade, extension, enum

### 26. `..` (cascade) trả về cái gì?

- [ ] A. Kết quả của method vừa gọi
- [X] B. Chính object ban đầu
- [ ] C. `null`
- [ ] D. Một bản sao của object

`Tự tin:` Đoán

---

## Kết quả chấm — 2026-09-08

**23/26 đúng.**

| Câu sai | Chủ đề | Vá ở mục |
|:---:|---|:---:|
| 5 | Named parameter phải gọi kèm tên | **02** |
| 11 | `late` ≠ nullable | **03** |
| 18 | Lazy = *chưa chạy*, không phải *chạy sau* | **06** |

### Hiệu chuẩn tự tin đang **ngược** — phát hiện quan trọng nhất

| | Số câu |
|---|---:|
| Ghi `Chắc` nhưng **sai** (cả 2 file) | **7** |
| Ghi `Đoán` nhưng **đúng** (file này) | **6** |

Bạn đánh `Đoán` ở câu 20, 21, 22, 26 (`==`/`hashCode`, `const` constructor, `copyWith`, cascade) — **đúng cả bốn**. Ngược lại đánh `Chắc` ở câu 5, 11, 18 — **sai cả ba**.

Nghĩa là cảm giác "mình chắc" hiện **không dùng được** làm tín hiệu. Đây cũng là lời giải thích cho giai đoạn 1: code chạy được nên cảm thấy đã hiểu.

**Cách chữa:** ở các mục sau, đừng tin cảm giác — viết một `expect(...)` để nó tự chứng minh. Đây chính là lý do đã dựng `package:test` ở bước setup.

---

## Tự tổng kết trước khi nộp

Đếm số câu `Đoán` theo từng mục — đây chính là bản đồ học của bạn:

| Mục | Chủ đề | Số câu | Số câu `Đoán` |
|:---:|---|:---:|---|
| 01 | Cú pháp nền | 4 | |
| 02 | Hàm và closure | 3 | |
| 03 | Null safety | 4 | |
| 04 | OOP cơ bản | 3 | |
| 05 | Kế thừa, interface | 2 | |
| 06 | Collection, Iterable | 3 | |
| 07 | `==`/`hashCode`, bất biến | 3 | |
| 08 | Future, async | 2 | |
| 09 | Xử lý lỗi | 1 | |
| 10–12 | Cascade, extension, enum | 1 | |

**Mục cần đi chậm nhất:**

**Mục tôi tự tin có thể đi nhanh:**
