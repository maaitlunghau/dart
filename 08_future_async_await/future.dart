/// `Future<T>`
/// - giá trị sẽ có sau
Future<String> fetchName() async {
  await Future.delayed(const Duration(milliseconds: 100));
  return 'maaitlunghau';
}

/// Giả lập tác vụ chậm
Future<int> slow(int ms, int value) async {
  await Future.delayed(Duration(milliseconds: ms));
  return value;
}

/// Tuần tự:
/// - chờ xong cái này, mới chạy cái kia (~200ms)
Future<int> sequential() async {
  final a = await slow(100, 1);
  final b = await slow(100, 2);

  return a + b;
}

/// Song song:
/// - bắn cả hai rồi chờ chung (~100ms)
Future<int> parallel() async {
  final results = await Future.wait([slow(100, 1), slow(100, 2)]);
  return results[0] + results[1];
}

/// Hàm luôn ném lỗi, dùng làm mồi cho hai demo bên dưới.
Future<String> failing() async {
  await Future.delayed(const Duration(milliseconds: 10));
  throw Exception('Network Error');
}

/// try-catch quanh `await`
/// - bắt được lỗi async bình thường
Future<String> caught() async {
  try {
    return await failing();
  } catch (e) {
    return 'catch: $e';
  }
}

/// QUÊN `await`
/// - lỗi không nổi lên chỗ gọi, try-catch vô dụng
/// - `.ignore()` chỉ để demo khỏi sập — bỏ nó ra là chương trình crash thật
Future<String> forgotAwait() async {
  try {
    failing().ignore();
    return 'try-catch KHÔNG bắt được gì';
  } catch (e) {
    return 'catch: $e';
  }
}

/// `.then()`: `await` dễ đọc hơn
Future<String> withThen() {
  return fetchName().then((name) => 'then: $name');
}

Future<void> main() async {
  print('--- Future không phải giá trị ---');
  print('không await = ${fetchName()}');
  print('có await    = ${await fetchName()}');

  print('--- await: không chặn: tuần tự vs song song ---');
  var sw = Stopwatch()..start();
  final s = await sequential();
  print('sequential() = $s trong ${sw.elapsedMilliseconds}ms');

  sw = Stopwatch()..start();
  final p = await parallel();
  print('parallel()   = $p trong ${sw.elapsedMilliseconds}ms');

  print('--- lỗi trong async ---');
  print('có await    -> ${await caught()}');
  print('quên await  -> ${await forgotAwait()}');

  print('--- then() ---');
  print(await withThen());
}
