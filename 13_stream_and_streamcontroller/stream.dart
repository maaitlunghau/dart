import 'dart:async';

/// Future = MỘT giá trị, một lần.
Future<int> oneValue() async => 42;

/// Stream = NHIỀU giá trị theo thời gian.
Stream<int> manyValues() => Stream.fromIterable([1, 2, 3]);

/// Vòng đời đầy đủ: add -> listen -> cancel -> close.
/// `onDone` chỉ chạy khi controller được `close()`
Future<String> lifecycle() async {
  final controller = StreamController<int>();
  final received = <int>[];
  var doneCalled = false;

  final sub = controller.stream.listen(
    received.add,
    onDone: () => doneCalled = true,
  );

  controller.add(1);
  controller.add(2);
  await Future<void>.delayed(Duration.zero);

  await controller.close(); // đóng nguồn -> onDone run
  await sub.cancel();

  return 'nhận $received, onDone=$doneCalled';
}

/// QUÊN cancel: không giữ subscription, listener sống mãi.
Future<int> forgetCancel() async {
  final controller = StreamController<int>();
  var received = 0;

  controller.stream.listen((_) => received++); // ko giữ lại gì

  controller.add(1);
  await Future<void>.delayed(Duration.zero);

  // giả lập 'màn hình đã đóng' - nhưng listener vẫn nghe
  controller.add(2);
  controller.add(3);
  await Future<void>.delayed(Duration.zero);

  await controller.close();
  return received;
}

/// CÓ cancel: dừng nhận ngay khi không cần nữa
Future<int> withCancel() async {
  final controller = StreamController<int>();
  var received = 0;

  final sub = controller.stream.listen((_) => received++);

  controller.add(1);
  await Future<void>.delayed(Duration.zero);

  await sub.cancel(); // clear

  controller.add(2);
  controller.add(3);
  await Future<void>.delayed(Duration.zero);

  await controller.close();
  return received;
}

/// Single-subscription: chỉ cho MỘT listener
Future<String> singleSubscription() async {
  final controller = StreamController<int>();
  controller.stream.listen((_) {});

  try {
    controller.stream.listen((_) {}); // listener thứ hai
    return 'cho phép 2 listener';
  } on StateError catch (e) {
    await controller.close(); // dọn dẹp cả ở nhánh lỗi
    return 'Chặn listener thứ hai: ${e.message}';
  }
}

/// Broadcast: cho phép nhiều listener cùng nghe.
Future<String> broadcast() async {
  final controller = StreamController<int>.broadcast();
  var a = 0;
  var b = 0;

  final s1 = controller.stream.listen((_) => a++);
  final s2 = controller.stream.listen((_) => b++);

  controller.add(1);
  controller.add(2);
  await Future<void>.delayed(Duration.zero);

  await s1.cancel();
  await s2.cancel();
  await controller.close();

  return 'listener A nhận $a, listener B nhận $b';
}

Future<void> main() async {
  print('--- Future vs Stream ---');
  print('Future  -> ${await oneValue()}');
  print('Stream  -> ${await manyValues().toList()}');

  print('--- await for ---');
  await for (final v in manyValues()) {
    print('  nhận $v');
  }

  print('--- vòng đời ---');
  print(await lifecycle());

  print('--- rò rỉ vs dọn dẹp ---');
  print('quên cancel -> nhận ${await forgetCancel()} sự kiện');
  print('có  cancel  -> nhận ${await withCancel()} sự kiện');

  print('--- single vs broadcast ---');
  print(await singleSubscription());
  print(await broadcast());
}
