# Dart Roadmap — Từ nền tảng đến sẵn sàng học Flutter

Roadmap này thay thế cách học cũ ("học tới đâu tính tới đó", dựa vào AI code hộ theo pattern đề
thi — xem `_archive/`).

**Nguyên tắc:**

- Mỗi mục là **một thư mục thật** ở root — code tự viết nằm trong đó, không phải chỉ đọc lý thuyết.
- Đi theo tier: xong hết tier 0 mới sang tier 1. Trong cùng tier có thể linh hoạt thứ tự.
- AI dùng như **tài liệu tham khảo**: giải thích khái niệm, đề xuất code mẫu, review, gỡ lỗi.
  Được phép nhận code hoàn chỉnh từ AI, với hai điều kiện: **tự gõ lại vào file** và **giải thích
  lại được từng dòng**. Ranh giới là ở chỗ hiểu, không phải ở chỗ ai gõ ra trước.
- Một mục coi là xong khi tự giải thích lại được bằng lời, không nhìn tài liệu.
- `_archive/` là tham chiếu về pattern (không phải chuẩn để học theo) — dùng để đối chiếu ở `00_`.

---

## Bảng tổng quan

| # | Thư mục | Tier | Mô tả ngắn |
|---|---|:---:|---|
| 00 | `00_gap_check` | 0 | ✅ **2026-09-08** — 42/51. Bỏ phần tự luận để rút ngắn. Lỗ hổng: mục 05, 02, 03, 06, 09 |
| 01 | `01_basic_syntax` | 0 | ✅ **2026-09-08** — `variables.dart`, `basics.dart` |
| 02 | `02_functions_and_closures` | 0 | ✅ **2026-09-08** — `functions.dart` |
| 03 | `03_null_safety` | 0 | ✅ **2026-09-08** — `null_safety.dart` |
| 04 | `04_oop_basics` | 0 | ✅ **2026-09-08** — `oop_basics.dart` |
| 05 | `05_inheritance_and_interfaces` | 0 | ✅ **2026-09-08** — `inheritance.dart` |
| 06 | `06_collections_and_iterable` | 0 | ✅ **2026-09-09** — `collections.dart` |
| 07 | `07_equality_and_immutability` | 0 | ✅ **2026-09-09** — `equality.dart` · **hết Tier 0** |
| 08 | `08_future_async_await` | 1 | ✅ **2026-09-09** — `future.dart` |
| 09 | `09_error_handling` | 1 | ✅ **2026-09-09** — `error_handling.dart` · vá nốt lỗ hổng cuối của mục 00 |
| 10 | `10_cascade_notation` | 1 | ✅ **2026-09-09** — `cascade.dart` |
| 11 | `11_extension_methods` | 1 | ✅ **2026-09-09** — `extensions.dart` |
| 12 | `12_enums` | 1 | Enum thường và enhanced enum (có field/method) |
| 13 | `13_stream_and_streamcontroller` | 2 | `Stream`, `StreamController`, kỷ luật `dispose`/`cancel` |
| 14 | `14_mixin` | 2 | `mixin`, `with`, resolution order |
| 15 | `15_advanced_generics` | 2 | Tự viết generic class, bounded type, multi-param |
| 16 | `16_sealed_classes_pattern_matching` | 2 | `sealed class` + `switch` pattern matching (Dart 3) |
| 17 | `17_json_serialization` | 2 | `dart:convert`, `fromJson`/`toJson` thủ công |
| 18 | `18_project_structure_and_testing` | 2 | `pubspec.yaml`, tổ chức `lib/`, `package:test` |
| 19 | `19_isolates` | 3 | `Isolate.run()`, `compute()` cho tác vụ nặng |
| 20 | `20_advanced_async_patterns` | 3 | `StreamTransformer`, `async*`/`yield*`, event loop |

**Tier 0** — nền tảng bắt buộc, không được bỏ mục nào.
**Tier 1** — cốt lõi hướng Flutter, dùng hằng ngày khi viết app.
**Tier 2** — nâng cao, cần trước khi đụng state management thật.
**Tier 3** — optional, học khi gặp nhu cầu cụ thể.

---

# TIER 0 — Nền tảng bắt buộc

## 00 — `00_gap_check`

**Triển khai:** Một file ghi chú (không phải code). **Không mở lại code trong `_archive/`**, tự trả
lời bằng lời hoặc viết lại từ đầu:

- Vì sao `Calculator extends Stationery` (assignment_01) bắt buộc override method abstract?
- Vì sao field `_` chỉ giới hạn theo **file**, không theo class hay folder?
- `Map<int, Calculator>` (assignment_01) vs `HashSet<Account>` (assignment_02) khác nhau ở đâu về
  tra cứu và xử lý trùng?
- `Employee implements Person` (standard_demo_dart) khác gì `extends`?
- Vòng lặp `while (true) { try {...} break; catch {...} }` giải quyết vấn đề gì?

**Nắm được:** Danh sách phân định rõ — phần nào trong `_archive/` là hiểu thật, phần nào chỉ là
nhìn AI viết. Chỗ nào bí thì ghi lại, sẽ vá đúng ở mục 04–07.

**Áp dụng:** Không học lại thứ đã biết, không bỏ sót thứ tưởng biết. Đây là mục rẻ nhất nhưng quyết
định roadmap có đi nhanh được không.

> **Đã làm — 2026-09-08.** Triển khai thành 2 bài trắc nghiệm thay vì ghi chú tự luận:
> `01_quiz_archive.md` (19/25) và `02_quiz_fundamentals.md` (23/26).
> Phần tự luận **cố ý bỏ** để rút ngắn thời gian — 5 câu gốc ở trên chưa được trả lời bằng lời.
>
> Lỗ hổng cần đi chậm: **05** (abstract → bắt buộc override), **02** (named parameter),
> **03** (`late` ≠ nullable), **06** (khoá `Map`, `Iterable` lazy), **09** (`on X` chỉ bắt đúng X).
> Đi nhanh được: **07** và **08**.
>
> Phát hiện lớn nhất: hiệu chuẩn tự tin đang ngược — 7 câu ghi "Chắc" thì sai, 6 câu ghi "Đoán"
> thì đúng. Từ mục 01 trở đi, kiểm chứng bằng `expect(...)` thay vì tin cảm giác.

---

## 01 — `01_basic_syntax`

**Triển khai:** Mỗi chủ đề một file nhỏ chạy được — khai báo `var`/`final`/`const`, kiểu built-in
(`int`, `double`, `String`, `bool`), toán tử số học/so sánh/logic, string interpolation `$x`
`${expr}`, `if/else`, vòng lặp `for`/`for-in`/`while`, `switch`.

**Nắm được:**
- `final` = gán một lần lúc chạy; `const` = phải biết giá trị lúc **biên dịch**. Đây là khác biệt
  quan trọng nhất trong mục này, không phải chuyện "cả hai đều bất biến".
- `int`/`double` đều là `num`, và `int` trong Dart không tự chuyển thành `double`.
- `switch` trong Dart 3 là biểu thức có thể trả về giá trị, không chỉ là câu lệnh.

**Áp dụng:** `const` là nền cho `const` widget ở mục 07 — thứ giúp Flutter bỏ qua rebuild không cần
thiết. String interpolation dùng liên tục để dựng text hiển thị.

---

## 02 — `02_functions_and_closures`

**Triển khai:** Viết hàm với named parameters (`{required String name, int age = 0}`), optional
positional (`[int? x]`), arrow function `=>`, hàm nhận hàm khác làm tham số, và một closure giữ
trạng thái (ví dụ hàm `makeCounter()` trả về hàm tăng biến đếm).

**Nắm được:**
- Named parameters khác positional thế nào, và vì sao `required` tồn tại.
- Hàm là first-class object — gán được cho biến, truyền được như tham số.
- Closure "nhớ" biến ở scope ngoài, kể cả sau khi hàm ngoài đã kết thúc.

**Áp dụng:** Toàn bộ Flutter widget đều nhận named parameters (`Container(width: 100, child: ...)`).
Mọi callback UI (`onPressed: () { ... }`) là closure bắt biến từ `build()`. Không nắm mục này thì
đọc code Flutter sẽ thấy như cú pháp lạ.

---

## 03 — `03_null_safety`

**Triển khai:** Khai báo biến nullable `String?` và non-nullable, thử để compiler báo lỗi rồi sửa
đúng cách; dùng `??`, `??=`, `?.`; khai báo `late` và cố tình đọc trước khi gán để thấy lỗi runtime;
viết hàm nhận `String?` rồi kiểm tra `!= null` để thấy compiler tự thu hẹp kiểu.

**Nắm được:**
- `?` (có thể null) vs `!` (khẳng định không null — và vì sao `!` bừa bãi là mầm crash).
- `late` dùng khi nào là hợp lý (khởi tạo trễ có kiểm soát) vs khi nào là che giấu bug.
- Type promotion: sau `if (x != null)` thì trong khối đó `x` đã là non-nullable, không cần `!`.

**Áp dụng:** State trong Flutter thường nullable trước khi load xong (`User? user`). Controller
thường khai `late final`. `??` dùng để đặt giá trị mặc định khi dữ liệu API thiếu field.

---

## 04 — `04_oop_basics`

**Triển khai:** Viết một class có: constructor thường (`Person(this.name)`), named constructor
(`Person.guest()`), factory constructor (trả về instance có sẵn hoặc chọn subtype),
initializer list (`: assert(...)` hoặc gán field tính toán), getter/setter, và field private `_`.

**Nắm được:**
- Ba loại constructor khác nhau ở đâu và khi nào bắt buộc dùng factory (khi cần trả về object đã có
  sẵn hoặc quyết định kiểu trả về lúc chạy).
- Initializer list chạy **trước** thân constructor, nên nó là chỗ duy nhất gán được `final` field.
- Private `_` là **library-private** (phạm vi file), không phải class-private.

**Áp dụng:** Mọi widget là một class có constructor. Factory constructor là cách chuẩn viết
`User.fromJson(json)` ở mục 17. Quy ước `_MyPageState` trong Flutter chính là private theo file.

---

## 05 — `05_inheritance_and_interfaces`

**Triển khai:** Một `abstract class` định nghĩa hành vi chung, hai class con `extends` nó và
`@override` method; một class khác `implements` cùng interface đó để thấy khác biệt; viết một hàm
nhận kiểu cha nhưng chạy được với mọi con (đa hình). Đối chiếu lại với `Calculator extends
Stationery` và `Employee implements Person` trong `_archive/`.

**Nắm được:**
- `extends` = kế thừa cả implementation (chỉ được một cha); `implements` = chỉ cam kết interface,
  phải viết lại toàn bộ (được nhiều).
- Abstract class không tạo instance trực tiếp được, và vì sao method abstract bắt buộc override.
- Đa hình: gọi cùng một method, chạy ra hành vi khác nhau tùy object thật là gì.

**Áp dụng:** **Đây là xương sống của Flutter** — `class MyPage extends StatelessWidget` +
`@override Widget build(...)` chính là mục này. Abstract class cũng là cách khai báo interface cho
repository/service để sau này thay implementation hoặc mock khi test.

---

## 06 — `06_collections_and_iterable`

**Triển khai:** Tạo `List`/`Set`/`Map`, dùng collection-if và collection-for ngay trong literal,
spread `...` và `...?`; xâu chuỗi `map` → `where` → `toList`; dùng `fold`/`reduce` để tính tổng;
đọc và giải thích được kiểu `List<String>`, `Map<String, int>`, `Future<User>` (mức đọc hiểu, chưa
tự viết generic).

**Nắm được:**
- Chọn `List` vs `Set` vs `Map` theo nhu cầu (thứ tự / không trùng / tra theo khoá).
- `Iterable` là **lazy** — `map` chưa chạy gì cho tới khi `toList()` hoặc lặp qua nó.
- Cú pháp `<T>` trong kiểu nghĩa là gì khi đọc code người khác.

**Áp dụng:** `items.map((e) => ItemTile(e)).toList()` là cách dựng danh sách widget phổ biến nhất
trong Flutter. Collection-if dùng để thêm widget có điều kiện ngay trong `children: [...]`.

---

## 07 — `07_equality_and_immutability`

**Triển khai:** Một class value-object: override `operator ==` **và** `hashCode` cùng lúc, kiểm
chứng bằng cách bỏ hai object "giống nhau" vào `Set` xem có gộp không; viết `const` constructor với
toàn bộ field `final`; viết method `copyWith` để tạo bản sao có sửa vài field.

**Nắm được:**
- Mặc định Dart so sánh **identity** (cùng ô nhớ), không so sánh nội dung — nên `==` phải tự override.
- Override `==` mà quên `hashCode` sẽ làm hỏng `Set`/`Map` một cách âm thầm.
- Object bất biến thì không sửa tại chỗ — muốn đổi thì tạo bản mới (`copyWith`).

**Áp dụng:** Đây là mục "vô hình nhưng quyết định" của Flutter: `const MyWidget()` cho phép framework
bỏ qua rebuild; so sánh state cũ/mới bằng `==` là cách mọi state management (Bloc, Riverpod, Provider)
quyết định có vẽ lại UI hay không; `copyWith` là cách chuẩn cập nhật state bất biến.

---

# TIER 1 — Cốt lõi hướng Flutter

## 08 — `08_future_async_await`

**Triển khai:** Hàm trả `Future<T>`, dùng `Future.delayed` để giả lập tác vụ chậm; gọi bằng `await`
trong hàm `async`; bọc `try/catch` quanh `await`; chạy nhiều future song song bằng `Future.wait`;
so sánh cùng đoạn code khi dùng `.then()` để thấy vì sao `await` dễ đọc hơn.

**Nắm được:**
- `Future<T>` là "giá trị sẽ có sau", không phải giá trị.
- `await` không chặn chương trình — nó nhường quyền cho việc khác chạy tiếp.
- Lỗi trong async không tự nổi lên chỗ gọi nếu quên `await`.

**Áp dụng:** Mọi thao tác gọi API, đọc ổ đĩa, truy vấn database trong Flutter đều là `Future`. Đây là
nền của `FutureBuilder` và của mọi hàm `onPressed: () async { ... }`.

---

## 09 — `09_error_handling`

**Triển khai:** Tự định nghĩa exception riêng (`class NetworkException implements Exception`), phân
biệt trường hợp nên throw với trường hợp nên trả `null`; dùng `try/on/catch/finally`, `rethrow` để
ném lại sau khi log; in `StackTrace`.

**Nắm được:**
- `Exception` = lỗi dự kiến, có thể xử lý (mất mạng, dữ liệu sai); `Error` = lỗi lập trình, không nên
  bắt (null check fail, index out of range).
- Custom exception nói lên *chuyện gì đã xảy ra*, hơn hẳn `Exception("...")` chung chung như trong
  `_archive/`.
- `on X catch (e, st)` bắt đúng loại thay vì bắt tất cả rồi nuốt lỗi.

**Áp dụng:** Phân biệt được "lỗi mạng → hiện nút Thử lại" với "lỗi code → phải sửa" là điều kiện để
làm màn hình error state tử tế thay vì hiện màn hình đỏ của Flutter.

---

## 10 — `10_cascade_notation`

**Triển khai:** Cấu hình một object qua nhiều bước bằng `..` thay vì lặp lại tên biến; thử `?..` trên
object nullable; kết hợp cascade với constructor trong một biểu thức duy nhất.

**Nắm được:**
- `..` trả về **chính object đó** chứ không phải kết quả của method — đó là toàn bộ ý nghĩa của nó.
- Khi nào cascade làm code sáng hơn, khi nào làm code khó đọc hơn.

**Áp dụng:** Rất phổ biến khi cấu hình `Paint()`, `TextEditingController`, `AnimationController`,
hoặc dựng một object nhiều thuộc tính mà không cần biến tạm.

---

## 11 — `11_extension_methods`

**Triển khai:** Viết `extension` trên `String` (ví dụ `isValidEmail`), trên `int` (ví dụ
`toCurrency()`), và trên một class có sẵn của mình; thử gọi từ file khác để thấy phải import mới
dùng được.

**Nắm được:**
- Thêm hành vi cho type không sở hữu, không cần kế thừa hay wrapper.
- Extension được phân giải **lúc biên dịch** theo kiểu tĩnh, nên không phải là đa hình.

**Áp dụng:** Trong Flutter cực kỳ hay dùng: `extension on BuildContext` để viết `context.theme`,
`context.screenWidth` thay cho `Theme.of(context)` dài dòng; extension validate cho form input.

---

## 12 — `12_enums`

**Triển khai:** Enum thường, rồi enhanced enum có field + constructor + method (ví dụ
`enum Status { active('Đang hoạt động'), banned('Bị khoá'); final String label; ... }`); dùng enum
trong `switch` và bỏ bớt một nhánh để thấy compiler cảnh báo thiếu.

**Nắm được:**
- Enum thay cho "magic string" — sai chính tả bị bắt lúc biên dịch thay vì lúc chạy.
- Enhanced enum gắn được dữ liệu và hành vi vào từng giá trị.
- `switch` trên enum là **exhaustive** — thêm giá trị mới, compiler chỉ ra mọi chỗ cần cập nhật.

**Áp dụng:** Mô tả trạng thái màn hình, loại người dùng, tab đang chọn. Là bước đệm nhẹ trước khi vào
sealed class ở mục 16.

---

# TIER 2 — Nâng cao

## 13 — `13_stream_and_streamcontroller`

**Triển khai:** Tạo `StreamController`, `add` vài giá trị, `listen` để nhận; giữ `StreamSubscription`
rồi `cancel()`; `close()` controller trong khối dọn dẹp; thử **cố tình quên** `cancel`/`close` để
thấy hậu quả; dùng `broadcast` khi cần nhiều listener.

**Nắm được:**
- `Future` = một giá trị, một lần. `Stream` = nhiều giá trị theo thời gian.
- Single-subscription vs broadcast stream khác nhau ra sao.
- Không `cancel`/`close` là rò rỉ tài nguyên — listener sống mãi dù không ai cần nữa.

**Áp dụng:** `StreamBuilder` để UI tự cập nhật theo dòng dữ liệu; mọi state management dựa trên
stream. Kỷ luật `dispose()` học ở đây chính là `@override void dispose()` trong `State` của Flutter —
đây là một trong những lỗi rò rỉ bộ nhớ phổ biến nhất của người mới.

---

## 14 — `14_mixin`

**Triển khai:** Viết một `mixin` chứa hành vi tái sử dụng, `with` nó vào class; `with` hai mixin cùng
định nghĩa một method để quan sát cái nào thắng; dùng `mixin X on Y` để giới hạn nơi được gắn.

**Nắm được:**
- Mixin giải quyết vấn đề mà đơn kế thừa không làm được: chia sẻ hành vi ngang giữa các class không
  cùng dòng dõi.
- Resolution order — mixin sau đè mixin trước (linearization).
- Khi nào chọn mixin, khi nào nên là kế thừa hoặc composition.

**Áp dụng:** Flutter dùng mixin khắp nơi: `with SingleTickerProviderStateMixin` cho animation,
`with WidgetsBindingObserver` để nghe vòng đời app. Hiểu mục này thì mấy dòng đó hết bí ẩn.

---

## 15 — `15_advanced_generics`

**Triển khai:** Tự viết `class Box<T>`, rồi generic class hai tham số (`class Pair<K, V>`), rồi
bounded type (`class Sorter<T extends Comparable<T>>`); viết generic method độc lập; thử truyền kiểu
sai để thấy compiler chặn.

**Nắm được:**
- Generic giữ được an toàn kiểu mà không phải viết lại code cho từng kiểu.
- `extends` trong generic nghĩa là **ràng buộc kiểu**, không phải kế thừa.
- Vì sao dùng `dynamic` là vứt bỏ toàn bộ lợi ích trên.

**Áp dụng:** Viết `Repository<T>` hoặc `ApiClient` trả `Future<List<T>>` dùng chung cho mọi model.
Cũng là cách đọc hiểu `State<T>`, `ValueNotifier<T>`, `Bloc<Event, State>` trong Flutter.

---

## 16 — `16_sealed_classes_pattern_matching`

**Triển khai:** Một `sealed class` với các subclass cụ thể (ví dụ `Loading` / `Success` / `Failure`);
`switch` trên nó và bỏ sót một nhánh để thấy compiler báo thiếu; dùng destructuring pattern để lấy
dữ liệu ra ngay trong nhánh `case`; dùng `switch` dạng biểu thức trả về giá trị.

**Nắm được:**
- `sealed` = compiler biết **trọn bộ** subclass, nên kiểm tra được tính đầy đủ của `switch`.
- Pattern matching lấy dữ liệu ra trực tiếp, không cần cast thủ công.
- Khác biệt với enum: sealed class mang được dữ liệu riêng cho từng trạng thái.

**Áp dụng:** Đây là cách hiện đại để mô hình hoá state UI: `sealed class LoadState` rồi `switch` trong
`build()` để trả về widget tương ứng — không còn `if (isLoading) ... else if (error != null) ...`.
Là nền của Bloc/Riverpod state.

---

## 17 — `17_json_serialization`

**Triển khai:** Dùng `dart:convert`: `jsonDecode` một chuỗi JSON thành `Map<String, dynamic>`, viết
`factory User.fromJson(Map<String, dynamic> json)` và `Map<String, dynamic> toJson()`; xử lý field
thiếu/null và list lồng nhau (`List<Address>`); `jsonEncode` ngược lại.

**Nắm được:**
- `jsonDecode` trả `dynamic` — ranh giới nguy hiểm nhất, phải ép về model có kiểu ngay lập tức.
- Vì sao `fromJson` nên là factory constructor (mục 04).
- Cách xử lý dữ liệu thiếu bằng `??` (mục 03) thay vì để crash.

**Áp dụng:** Mọi app Flutter gọi REST API đều đi qua đúng quy trình này. Đây là thứ thay thế hoàn
toàn CSV thủ công trong `_archive/`.

---

## 18 — `18_project_structure_and_testing`

**Triển khai:** Đọc và giải thích `pubspec.yaml` (dependency, version constraint `^`); tổ chức `lib/`
theo tầng (model / repository / service); viết unit test với `package:test` — `group`, `test`,
`expect`, `setUp`; chạy `dart analyze` và `dart format`; đối chiếu cách `exam_dart` chia tầng với
cách `assignment_01` để phẳng.

**Nắm được:**
- Tách logic khỏi I/O thì mới test được — đây là lý do thật của việc chia tầng.
- Semantic versioning và ý nghĩa của `^` trong dependency.
- `analysis_options.yaml` quyết định mức nghiêm khắc của lint.

**Áp dụng:** Cấu trúc `lib/` học ở đây áp thẳng vào Flutter project. Logic tách khỏi widget thì test
được bằng unit test thường, không cần widget test — đây là khác biệt giữa app "chạy được" và app
"chỉnh chu" như mục tiêu ban đầu.

---

# TIER 3 — Optional, để cuối

## 19 — `19_isolates`

**Triển khai:** Chạy một vòng lặp nặng trực tiếp và đo thời gian; chuyển nó sang `Isolate.run()`; thử
truyền object không gửi được qua isolate để thấy giới hạn.

**Nắm được:**
- Dart chạy đơn luồng — tác vụ CPU nặng sẽ chặn mọi thứ khác, kể cả UI.
- Isolate **không chia sẻ bộ nhớ**, chỉ trao đổi qua message.
- Async (mục 08) giải quyết chờ I/O, isolate giải quyết tính toán nặng — hai vấn đề khác nhau.

**Áp dụng:** `compute()` trong Flutter để parse JSON lớn, xử lý ảnh, mã hoá... mà không làm giật
khung hình.

---

## 20 — `20_advanced_async_patterns`

**Triển khai:** Viết generator `async*` với `yield`/`yield*`; dùng `Stream.periodic`; biến đổi stream
bằng `map`/`where`/`distinct`/`debounce` (qua `StreamTransformer` hoặc package); in thứ tự thực thi
để quan sát microtask queue và event queue.

**Nắm được:**
- `async*` sinh dữ liệu dần thay vì gom hết rồi trả một lượt.
- Vì sao thứ tự chạy async đôi khi phản trực giác (microtask ưu tiên hơn event).
- Biến đổi stream ngay tại nguồn thay vì xử lý ở nơi tiêu thụ.

**Áp dụng:** Debounce ô tìm kiếm để không gọi API mỗi lần gõ phím; ghép nhiều nguồn dữ liệu trước khi
đẩy vào `StreamBuilder`.

---

## Đã cân nhắc và **cố ý loại**

| Nội dung | Lý do loại |
|---|---|
| `dart:io` file/stdin, CSV thủ công, menu `switch` console | Di sản console-app trong `_archive/`, gần như không dùng trong Flutter. Muốn khép lại chương cũ thì đọc lướt, không lập thư mục. |
| `Queue`, labeled `break`/`continue`, raw string / multi-line string | ROI thấp, tra khi cần. |
| Operator overloading ngoài `==` | Hiếm dùng ở giai đoạn này. |

---

## Sau roadmap này

Đủ nền để vào giáo trình Flutter chính thức mà không hổng Dart. Mấy cầu nối nên tự nối trước khi bắt
đầu:

| Khái niệm Flutter | Thực chất là mục nào |
|---|---|
| Widget là cây object bất biến | 05 (kế thừa) + 07 (`const`, bất biến) |
| `StatelessWidget` vs `StatefulWidget` | 04 + 07 — object cấu hình tách khỏi object giữ state |
| `FutureBuilder` / `StreamBuilder` | 08 và 13 |
| `setState` làm UI vẽ lại | 07 — so sánh state cũ/mới |
| Quản lý state (Bloc/Riverpod) | 07 + 16 |

Học Flutter trước khi vững 08 và 13 là nguyên nhân phổ biến nhất của "code chạy được mà không hiểu
tại sao".

---

## Cách dùng file này

- Xong mục nào thì ghi ngày hoàn thành + ghi chú ngay trong bảng tổng quan — lịch sử học nằm trong
  git log của chính file này.
- Học tới mục sau mà phát hiện hổng mục trước → quay lại, đừng đi tiếp theo quán tính.
- `README.md` ở root mô tả bức tranh tổng thể của repo (2 giai đoạn, cấu trúc); file này là lộ trình
  học chi tiết. Hai file, hai mục đích.
