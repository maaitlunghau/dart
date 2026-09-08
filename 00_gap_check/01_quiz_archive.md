# 00.1 — Trắc nghiệm: kiến thức cũ trong `_archive/`

25 câu, sắp từ dễ đến khó, hỏi về đúng những gì bạn đã viết ở giai đoạn 1.

**Luật:**

- [ ] Không mở lại code trong `_archive/`
- [ ] Không Google, không hỏi AI trong lúc làm
- [ ] Không chắc thì cứ chọn, nhưng phải ghi `Tự tin: Đoán` — **đoán mà ghi "Chắc" là tự phá bài chẩn đoán của chính. mình**
- [ ] Dòng `Vì sao` bắt buộc điền: trắc nghiệm 4 đáp án có 25% đoán trúng, chỉ lý do mới phân biệt được hiểu và may

Không có đáp án trong file này. Làm xong đưa đi chấm.

**Bắt đầu:** ___ **Xong:** ___

---

## Phần A — Dễ (1–8)

### 1. Trong `assignment_01`, `abstract class Stationery` khai báo `void exportData();` — không có thân hàm. Đó gọi là gì?

- [ ] A. Method rỗng, chạy không làm gì
- [X] B. Abstract method — chỉ có chữ ký, class con phải tự viết thân
- [ ] C. Static method
- [ ] D. Getter

`Tự tin:` Chắc · `Vì sao: Đơn giản vì có keyword abstract ngay ở đầu method, nên nhìn vào sẽ biết được ngay đây là một abstract method rồi, ko cần phải nói thêm, và dùng để cho các class khác extends hoặc implements nó` 

> ⚠️ **Đáp án đúng, nhưng lý do SAI.** Code thật là `void exportData();` — **không hề có** từ khoá `abstract` nào ở method. Từ `abstract` nằm ở `abstract class Stationery`, không nằm ở method.
>
> **Ghi nhớ:** một method **không có thân hàm** nằm trong abstract class thì **tự động** là abstract. Không cần đánh dấu gì.
>
> Chính hiểu nhầm này làm bạn sai câu 2 ngay bên dưới — một lỗ hổng, hai câu.

### 2. `class Calculator extends Stationery` mà **không** viết `exportData()` thì điều gì xảy ra?

- [X] A. Chạy bình thường, method không làm gì cả — ❌ **BẠN CHỌN · SAI**
- [ ] B. Lỗi lúc **biên dịch** — ✅ **ĐÁP ÁN ĐÚNG**
- [ ] C. Chạy được, chỉ lỗi lúc gọi `exportData()`
- [ ] D. Tự động kế thừa một bản rỗng từ `Stationery`

`Tự tin:` Chắc · `Vì sao: Vì đơn giản là nó đang thừa kế (extends) lại chứ ko phải implements, cho nên class Calculator sẽ được quyền dùng hoặc ko dùng tới exportData() - khi nào dùng thì gọi @Override ra. `

> ❌ **Sai ở đâu:** `extends` **không** cho quyền "dùng hoặc không dùng". Một class **cụ thể** kế thừa abstract class thì **bắt buộc** phải cài đặt mọi abstract member — nếu không thì chính nó cũng phải khai là `abstract`.
>
> Compiler chặn ngay lúc biên dịch, không đợi tới lúc chạy:
> ```
> error - Missing concrete implementation of 'Stationery.exportData'.
>         Try implementing the missing method, or make the class abstract.
> ```
>
> **Ghi nhớ:** abstract method = *hợp đồng*, không phải *gợi ý*. Ký hợp đồng (`extends`) thì phải thực hiện.
>
> 👉 Đây là xương sống của Flutter: `class MyPage extends StatelessWidget` **bắt buộc** có `@override Widget build(...)` cũng vì đúng lý do này. Học kỹ ở **mục 05**.

### 3. `Calculator` có field `int _code = 0;`. Dấu `_` giới hạn truy cập ở phạm vi nào?

- [X] A. Chỉ trong class `Calculator` — ❌ **BẠN CHỌN · SAI**
- [ ] B. Chỉ trong **file** chứa nó — ✅ **ĐÁP ÁN ĐÚNG**
- [ ] C. Chỉ trong thư mục `lib/model/`
- [ ] D. Chỉ là quy ước đặt tên, không có tác dụng thật

`Tự tin:` Chắc · `Vì sao: Vì trong Dart quy định rõ: mỗi file .dart là một lib riêng, mỗi "_" sẽ tượng trưng cho phạm vi private, và nó sẽ giới hạn phạm vi sử dụng trong file (library) chứ ko phải theo class như trong Java/C#.`

> ⚠️ **Lỗi tay, không phải lỗ hổng.** Lý do bạn viết **chính xác tuyệt đối** và mô tả đúng đáp án B — nhưng ô tích lại rơi vào A. Ở file 02 câu 14 cùng khái niệm này bạn chọn **đúng**.
>
> **Ghi nhớ:** `_` là **library-private**, phạm vi = **file**. Hai class nằm chung một file thì đọc được `_` của nhau; cùng class nhưng khác file thì không. Khác hẳn `private` của Java/C# (phạm vi = class).

### 4. `int get code => _code;` tương đương với cách viết nào?

- [ ] A. `int code() { return _code; }`
- [ ] B. `final int code = _code;`
- [X] C. `int get code { return _code; }`
- [ ] D. `set code(int v) { _code = v; }`

`Tự tin:` Chắc / Đoán · `Vì sao:`

### 5. `ShopStore` khai báo `Map<int, Calculator> list = {};`. Chữ `int` đóng vai trò gì?

- [ ] A. Giá trị được lưu
- [ ] B. Số phần tử tối đa
- [X] C. Chỉ số mảng, luôn chạy 0, 1, 2… — ❌ **BẠN CHỌN · SAI**
- [ ] D. **Khoá** để tra cứu — ✅ **ĐÁP ÁN ĐÚNG**

`Tự tin:` Chắc

> ❌ **Sai ở đâu:** `Map<K, V>` — tham số **đầu tiên luôn là kiểu của KHOÁ**. Ở đây khoá là `code` của máy tính, kiểu `int`.
>
> Khoá **không** liên tục và **không** có thứ tự như chỉ số mảng: `list[1001] = ...` rồi `list[7] = ...` là hoàn toàn hợp lệ. Muốn chỉ số 0, 1, 2 thì đó là `List<Calculator>`.
>
> **Ghi nhớ:** `List` tra theo **vị trí**, `Map` tra theo **khoá do bạn đặt**.
>
> 👉 Đối chiếu: ở file 02 câu 17 bạn chọn đúng `Map<String, User>` với khoá là `id` — bạn hiểu khái niệm, chỉ chưa nhận ra nó khi nhìn `Map<int, ...>`. Ôn ở **mục 06**.

### 6. `Account(this.code, this.name, this.balance);` — cú pháp `this.x` trong tham số constructor làm gì?

- [X] A. Gán giá trị tham số vào field cùng tên, khỏi phải viết `code = code;`
- [ ] B. Tạo biến cục bộ tên `code` trong constructor
- [ ] C. Khai báo field mới cho class
- [ ] D. Gọi constructor của class cha

`Tự tin:` Chắc

### 7. `Account` có `@override String toString()`. Nếu **xoá** dòng `@override` đi thì sao?

- [ ] A. Lỗi biên dịch
- [ ] B. `toString()` không còn được gọi khi `print(account)`
- [X] C. Vẫn chạy y hệt — `@override` chỉ để analyzer kiểm giúp
- [ ] D. Lỗi lúc chạy

`Tự tin:` Chắc

### 8. `stdin.readLineSync()` trả về kiểu gì?

- [ ] A. `String`
- [X] B. `String?`
- [ ] C. `Object`
- [ ] D. `List<String>`

`Tự tin:` Chắc

---

## Phần B — Trung bình (9–18)

### 9. Trong `ShopStore.addNew()`:

```dart
String? input = stdin.readLineSync();
if (input == null) { return; }
// ... từ đây trở đi
```

Sau khối `if`, kiểu của `input` là gì?

- [ ] A. Vẫn là `String?`, phải dùng `input!` mới xài được
- [X] B. `String` — compiler tự thu hẹp kiểu
- [ ] C. `dynamic`
- [ ] D. `Object?`

`Tự tin:` Chắc

### 10. `ShopStore.addNew()` kiểm tra `if (list.containsKey(code)) { print("This code already exists!"); continue; }`. Việc này ngăn chuyện gì?

- [X] A. Ghi đè mất máy tính cũ đang có cùng `code`
- [ ] B. Tràn bộ nhớ khi Map quá lớn
- [ ] C. Lỗi biên dịch do trùng khoá
- [ ] D. `int.parse` ném exception

`Tự tin:` Chắc

### 11. `assignment_02` dùng `HashSet<Account> accountList`. Class `Account` **không** override `==` và `hashCode`. Bạn thêm 2 `Account` có `code`, `name`, `balance` **giống hệt nhau**. Set chứa mấy phần tử?

- [ ] A. 1 — Set tự loại trùng
- [X] B. 2
- [ ] C. 0 — bị từ chối cả hai
- [ ] D. Ném exception vì trùng

`Tự tin:` Chắc

### 12. Lý do đằng sau câu 11 là gì?

- [ ] A. `HashSet` chỉ loại trùng với kiểu số và chuỗi
- [X] B. Mặc định Dart so sánh **identity** (cùng ô nhớ), không so sánh nội dung
- [ ] C. Phải gọi `accountList.distinct()` thì mới loại trùng
- [ ] D. `HashSet` cần được khai báo `const` mới loại trùng được

`Tự tin:` Chắc

### 13. `ATM.findByCode()` duyệt `for (var account in accountList)` để tìm. `ShopStore.delete()` thì gọi thẳng `list.containsKey(code)`. Khác biệt về chi phí tra cứu?

- [ ] A. Như nhau, đều duyệt hết
- [ ] B. `ATM` nhanh hơn vì `HashSet` nhẹ hơn `Map`
- [X] C. `ShopStore` tra trực tiếp theo khoá; `ATM` phải quét tuần tự qua từng phần tử
- [ ] D. Không so sánh được vì hai kiểu dữ liệu khác nhau

`Tự tin:` Chắc

### 14. `ShopStore` có `} catch (_) {`. Dấu `_` ở đây nghĩa là gì?

- [ ] A. Bắt mọi loại lỗi kể cả `Error`
- [X] B. Tên biến quy ước cho "có nhận nhưng không dùng tới"
- [ ] C. Bỏ qua lỗi, không bắt gì cả
- [ ] D. Ném lại lỗi cho tầng trên

`Tự tin:` Chắc

### 15. `ShopStore.saveToFile()` viết `} on IOException catch (e) {`. Khác gì `} catch (e) {` trần?

- [ ] A. Không khác, chỉ là kiểu viết dài hơn
- [X] B. `on IOException` chỉ bắt đúng loại đó; lỗi loại khác vẫn thoát ra ngoài
- [ ] C. `on IOException` bắt được nhiều loại lỗi hơn
- [ ] D. `on` chỉ dùng được trong hàm `async`

`Tự tin:` Chắc

### 16. Trong `ATM.saveAccount()`, phần nhập balance có `if (balance <= 50) { print(...); continue; }` nằm trong `while (true)`. `continue` làm gì?

- [ ] A. Thoát khỏi vòng lặp
- [X] B. Bỏ qua phần còn lại của lượt này, quay lên hỏi nhập lại
- [ ] C. Thoát khỏi cả hàm `saveAccount()`
- [ ] D. Nhảy xuống khối `catch`

`Tự tin:` Chắc

### 17. Cấu trúc `while (true) { try { ...; break; } catch (e) { print(e); } }` xuất hiện khắp `_archive/`. Nếu **xoá dòng `break`** đi thì sao?

- [ ] A. Vòng lặp chạy đúng một lần rồi dừng
- [ ] B. Lỗi biên dịch vì `while (true)` bắt buộc có `break`
- [X] C. Vòng lặp chạy vô hạn kể cả khi nhập đúng
- [ ] D. `catch` tự động thoát vòng lặp

`Tự tin:` Chắc· `Vì sao: Đơn giản vì một vòng lặp cần phải có return/break để thoát khỏi vòng lặp khi đã thoã mản điều kiện. Nếu không có thì vòng lặp sẽ lặp lại vô hạn`

### 18. `worker.dart` khai báo `base class Worker`. Từ khoá `base` có tác dụng gì?

- [ ] A. Đánh dấu đây là class gốc, không cho tạo instance
- [ ] B. Buộc mọi class con phải nằm cùng thư mục
- [X] C. Cho phép `extends` nhưng chặn `implements` từ ngoài thư viện
- [ ] D. Chỉ là chú thích, không ảnh hưởng compiler

`Tự tin:` Chắc

---

## Phần C — Khó (19–25)

### 19. `Employee implements Person`, trong đó `Person` là abstract class. Giả sử bây giờ thêm vào `Person` một method **có thân hàm sẵn**. `Employee` có tự động dùng được thân hàm đó không?

- [ ] A. Có — `implements` cũng kế thừa phần đã cài đặt
- [X] B. Không — `implements` chỉ lấy chữ ký, `Employee` phải tự viết lại
- [ ] C. Có, nhưng phải gọi qua `super`
- [ ] D. Tuỳ, nếu method đó là `static` thì có

`Tự tin:` Chắc

### 20. `Calculator extends Stationery` và `StudentService implements StudentRepository` — cả hai đều dùng `@override`. Khác biệt **thực chất** giữa hai quan hệ này là gì?

- [ ] A. Không khác gì, chỉ là hai từ khoá đồng nghĩa
- [X] B. `extends` kế thừa cả phần cài đặt và chỉ được một cha; `implements` chỉ cam kết chữ ký và được nhiều
- [ ] C. `implements` nhanh hơn khi chạy
- [ ] D. `extends` chỉ dùng được với abstract class

`Tự tin:` Chắc

### 21. `Worker` khai báo `late int _id;`. Nếu đọc `worker.id` **trước khi** setter được gọi lần nào thì sao?

- [ ] A. Trả về `0`
- [ ] B. Trả về `null`
- [ ] C. Lỗi lúc **biên dịch**
- [X] D. Ném lỗi lúc **chạy**

`Tự tin:` Chắc

### 22. Trong `exam_dart`, `Student` có `_classify()` private, còn `StudentService` có `classify()` public với **logic y hệt**, và cả hai cùng giữ 3 điểm số. Vấn đề lớn nhất ở đây là gì?

- [ ] A. Không có vấn đề, tách vậy là đúng kiến trúc phân tầng
- [ ] B. Cùng một quy tắc nghiệp vụ tồn tại ở 2 nơi — sửa thang điểm phải nhớ sửa cả hai — ✅ **ĐÁP ÁN ĐÚNG**
- [X] C. `_classify()` private nên `StudentService` không chạy được — ❌ **BẠN CHỌN · SAI**
- [ ] D. Lỗi biên dịch do trùng tên method

`Tự tin:` Chắc

> ❌ **Sai ở đâu:** `StudentService` **không hề gọi** `Student._classify()`. Nó có `classify()` **của riêng nó**, code y hệt, chép lại. Nên chuyện private không cản trở gì cả — chương trình chạy bình thường.
>
> Vấn đề thật: thang điểm `>= 8.0 → Excellent` tồn tại ở **hai file**. Ngày nào đổi thang điểm mà chỉ sửa một chỗ, hai tầng sẽ cho ra kết quả khác nhau — và không có lỗi nào báo cho bạn biết.
>
> **Ghi nhớ:** code chạy được không có nghĩa là code đúng. Một quy tắc nghiệp vụ chỉ nên tồn tại ở **đúng một nơi**.

### 23. `StudentService` vừa gọi `stdin.readLineSync()` để nhập, vừa chứa `getAverage()` để tính. Hệ quả với việc viết unit test là gì?

- [ ] A. Không ảnh hưởng, test nào cũng chạy được
- [ ] B. Test phải giả lập bàn phím mới chạy được logic tính điểm — logic bị dính chặt vào I/O — ✅ **ĐÁP ÁN ĐÚNG**
- [X] C. Chỉ test được nếu đổi `stdin` sang `async` — ❌ **BẠN CHỌN · SAI**
- [ ] D. Dart không test được class có `implements`

`Tự tin:` Đoán · `Vì sao: Do tui chưa thử dùng Unit Test nên chưa nắm rõ phần này`

> ℹ️ **Chưa học tới — không tính là lỗ hổng.** Bạn đánh `Đoán` và nói rõ lý do, đúng tinh thần bài chẩn đoán.
>
> `async` không liên quan gì ở đây. Vấn đề là `getAverage()` (logic thuần tuý, dễ test) bị nhốt chung class với `stdin.readLineSync()` (I/O, cần bàn phím thật). Muốn test phép tính trung bình, bạn buộc phải giả lập cả bàn phím.
>
> **Ghi nhớ:** **tách logic khỏi I/O thì mới test được** — đó là lý do *thật* của việc chia tầng, không phải để code "trông chuyên nghiệp". Học ở **mục 18**.

### 24. Setter trong `Calculator` ném `throw Exception("Price must be greater than zero.")`. So với việc định nghĩa riêng `class InvalidPriceException implements Exception`, cách đang dùng mất đi điều gì quan trọng nhất?

- [ ] A. Tốc độ — `Exception` chung chậm hơn
- [X] B. Nơi bắt lỗi không thể phân biệt loại lỗi bằng `on ...`, chỉ còn cách đọc chuỗi text
- [ ] C. Không ghi được `StackTrace`
- [ ] D. Không throw được từ trong setter

`Tự tin:` Chắc

### 25. `ShopStore.loadFromFile()` đọc CSV rồi gọi `int.parse(parts[0])`, và bọc toàn bộ trong `try { ... } on IOException catch (e) { ... }`. File CSV có một dòng hỏng, ví dụ `abc,Casio,50.0,3`. Điều gì xảy ra?

- [ ] A. Dòng hỏng bị bỏ qua, các dòng còn lại vẫn nạp bình thường
- [X] B. `on IOException` bắt được và in ra lỗi — ❌ **BẠN CHỌN · SAI**
- [ ] C. `int.parse` ném `FormatException` — không phải `IOException` — nên lỗi thoát ra ngoài và làm sập chương trình — ✅ **ĐÁP ÁN ĐÚNG**
- [ ] D. `int.parse` trả về `null`, `code` thành 0

`Tự tin:` Chắc

> ❌ **Sai ở đâu:** `on IOException` là **bộ lọc**, không phải lưới bắt tất cả. `int.parse("abc")` ném `FormatException` — một loại hoàn toàn khác `IOException` — nên nó bay thẳng qua khối `catch` đó.
>
> Bạn đã trả lời **đúng** câu 15 (`on X` chỉ bắt đúng loại X). Câu này chỉ là áp dụng lại chính điều đó vào một tình huống cụ thể.
>
> **Ghi nhớ:** viết `on X catch` thì phải tự hỏi *"đoạn try này còn ném được loại lỗi nào khác không?"* — `int.parse`, `double.parse`, truy cập `parts[3]` khi dòng CSV thiếu cột, đều ném loại khác.
>
> 👉 Đây là **bug thật đang nằm trong `assignment_01`**, không phải câu hỏi giả định. Học cách vá ở **mục 09**.

---

## Kết quả chấm — 2026-09-08

**19/25 đúng.**

| Câu sai | Chủ đề | Vá ở mục |
|:---:|---|:---:|
| 2 | `extends` abstract class → **bắt buộc** override | **05** |
| 3 | *(lỗi tay — lý do viết đúng, tích nhầm ô)* | — |
| 5 | `Map<K, V>` — tham số đầu là **khoá** | **06** |
| 22 | Một quy tắc nghiệp vụ nằm ở 2 nơi | 04 |
| 23 | Logic dính chặt I/O → không test được | 18 *(chưa học)* |
| 25 | `on IOException` không bắt `FormatException` | **09** |

Câu 1 tích đúng nhưng **lý do sai** — và chính nó gây ra lỗi ở câu 2.

**Làm tốt nhất:** câu 11–12 (`HashSet` không loại trùng khi thiếu `==`/`hashCode`) — câu khó nhất cả bài, đúng cả hai.

---

## Tự tổng kết trước khi nộp

| | Số câu |
|---|---|
| Đánh `Chắc` | |
| Đánh `Đoán` | |

**Câu nào làm xong vẫn thấy mơ hồ nhất:**

**Chủ đề nào tôi tự thấy yếu nhất sau khi làm bài này:**
