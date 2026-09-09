import 'dart:async';

/// `async*` = generator sinh Stream. `yield` phát từng giá trị một,
/// không gom hết rồi trả một lượt như `Future<List<T>>`.
Stream<int> countTo(int n) async* {
  for (var i = 1; i <= n; i++) {
    await Future<void>.delayed(const Duration(milliseconds: 5));
    yield i;
  }
}

/// `yield*` = uỷ quyền cho một stream khác, khỏi lặp thủ công.
Stream<int> countTwice(int n) async* {
  yield* countTo(n);
  yield* countTo(n);
}

/// Generator là LAZY: chưa ai nghe thì thân hàm chưa chạy dòng nào.
Future<List<String>> lazyGenerator() async {
  final log = <String>[];

  Stream<int> gen() async* {
    log.add('generator bắt đầu chạy');
    yield 1;
  }

  final stream = gen();
  log.add('>> đã gọi gen(), chưa listen');
  await stream.toList();
  log.add('>> sau khi listen xong');

  return log;
}

/// Biến đổi ngay tại nguồn: map -> where -> distinct.
Future<List<int>> transformAtSource() {
  return Stream.fromIterable([1, 1, 2, 2, 3, 4, 4])
      .distinct()
      .where((n) => n.isEven)
      .map((n) => n * 10)
      .toList();
}

/// Thứ tự chạy async: microtask queue ưu tiên hơn event queue.
Future<List<String>> queueOrder() async {
  final log = <String>[];

  log.add('1 - đồng bộ');
  Future(() => log.add('4 - event queue'));
  Future.microtask(() => log.add('3 - microtask'));
  log.add('2 - đồng bộ');

  await Future<void>.delayed(const Duration(milliseconds: 10));
  return log;
}

/// Debounce: giá trị đến dồn dập thì bỏ qua, chỉ giữ giá trị cuối
/// sau khoảng lặng `d`. Đây là cách ô tìm kiếm tránh gọi API mỗi phím.
Stream<T> debounce<T>(Stream<T> source, Duration d) {
  final out = StreamController<T>();
  Timer? timer;

  source.listen(
    (value) {
      timer?.cancel();
      timer = Timer(d, () => out.add(value));
    },
    onDone: () async {
      await Future<void>.delayed(d * 2);
      timer?.cancel();
      await out.close();
    },
  );

  return out.stream;
}

/// Giả lập người dùng gõ: 'f','fl','flu' nhanh, rồi ngừng, rồi 'flutter'.
Stream<String> typing() async* {
  yield 'f';
  await Future<void>.delayed(const Duration(milliseconds: 10));
  yield 'fl';
  await Future<void>.delayed(const Duration(milliseconds: 10));
  yield 'flu';
  await Future<void>.delayed(const Duration(milliseconds: 120));
  yield 'flutter';
}

Future<void> main() async {
  print('--- async* và yield ---');
  print('countTo(3)    = ${await countTo(3).toList()}');
  print('countTwice(2) = ${await countTwice(2).toList()}');

  print('--- generator là lazy ---');
  for (final line in await lazyGenerator()) {
    print('  $line');
  }

  print('--- biến đổi tại nguồn ---');
  print('distinct -> where chẵn -> map x10 = ${await transformAtSource()}');

  print('--- thứ tự microtask vs event ---');
  for (final line in await queueOrder()) {
    print('  $line');
  }

  print('--- debounce 80ms ---');
  final kept = await debounce(
    typing(),
    const Duration(milliseconds: 80),
  ).toList();
  print('gõ 4 lần -> chỉ còn $kept');
}
