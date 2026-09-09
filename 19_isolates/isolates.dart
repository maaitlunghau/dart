import 'dart:async';
import 'dart:isolate';

/// Tác vụ CPU nặng — không phải chờ I/O, mà là tính thật.
int heavySum(int n) {
  var sum = 0;

  for (var i = 0; i < n; i++) {
    sum += i % 7;
  }

  return sum;
}

/// Biến toàn cục, dùng để chứng minh isolate không chia sẻ bộ nhớ.
int counter = 0;

/// Chạy thẳng: chặn event loop, Timer không chạy được lần nào.
Future<String> blocking(int n) async {
  var ticks = 0;
  final timer = Timer.periodic(const Duration(milliseconds: 5), (_) => ticks++);
  await Future<void>.delayed(const Duration(milliseconds: 20));

  final before = ticks;
  final sw = Stopwatch()..start();
  final result = heavySum(n);
  final ms = sw.elapsedMilliseconds;

  timer.cancel();
  return 'sum=$result · ${ms}ms · timer chạy ${ticks - before} lần TRONG lúc tính';
}

/// Chuyển sang isolate: main isolate rảnh, Timer vẫn chạy.
Future<String> withIsolate(int n) async {
  var ticks = 0;
  final timer = Timer.periodic(const Duration(milliseconds: 5), (_) => ticks++);
  await Future<void>.delayed(const Duration(milliseconds: 20));

  final before = ticks;
  final sw = Stopwatch()..start();
  final result = await Isolate.run(() => heavySum(n));
  final ms = sw.elapsedMilliseconds;

  timer.cancel();
  return 'sum=$result · ${ms}ms · timer chạy ${ticks - before} lần TRONG lúc tính';
}

/// Isolate KHÔNG chia sẻ bộ nhớ — nó nhận BẢN SAO.
Future<String> noSharedMemory() async {
  counter = 0;

  final inside = await Isolate.run(() {
    counter += 100; // sửa bản sao trong isolate
    return counter;
  });

  return 'trong isolate = $inside · ngoài main = $counter';
}

/// Giới hạn: object không "gửi" được thì ném lỗi lúc chạy (RemoteError).
Future<String> notSendable() async {
  try {
    final port = await Isolate.run(ReceivePort.new);
    port.close();
    return 'gửi được';
  } catch (e) {
    return 'không gửi được: ${e.runtimeType}';
  }
}

Future<void> main() async {
  const n = 200000000;

  print('--- chặn event loop ---');
  print('chạy thẳng   -> ${await blocking(n)}');
  print('qua isolate  -> ${await withIsolate(n)}');

  print('--- không chia sẻ bộ nhớ ---');
  print(await noSharedMemory());

  print('--- giới hạn gửi object ---');
  print(await notSendable());
}
