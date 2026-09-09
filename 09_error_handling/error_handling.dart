/// Custom exception:
/// - nói rõ CHUYỆN GÌ đã xảy ra
/// - hơn hẳn Exception('...') chung chung.
class NetworkException implements Exception {
  final String url;
  NetworkException(this.url);

  @override
  String toString() => 'Network Exception: không gọi được $url';
}

/// Bắt lỗi sai cách
/// - `on X` là BỘ LỌC EXCEPTION, ko phải bắt tất cả
/// - `int.parse` ném 'FormatException' nhưng lại bắt 'NetworkException'
String parseWrongCatch(String raw) {
  try {
    return 'ok ${int.parse(raw)}';
  } on NetworkException catch (e) {
    return 'bắt được: $e';
  }
}

/// Bắt đúng loại thì mới xử lý được.
String parseRightCatch(String raw) {
  try {
    return 'ok ${int.parse(raw)}';
  } on FormatException {
    return 'Invalid Format';
  }
}

/// `on X catch (e, st)`
/// - lấy được cả StackTrace
/// - `finally` luôn chạy
String withStackTrace(List<String> log) {
  try {
    throw NetworkException('api/users');
  } on NetworkException catch (e, st) {
    log.add('stack có ${st.toString().trim().split('\n').length} dòng');
    return '$e';
  } finally {
    log.add('Finally always run');
  }
}

/// `rethrow`:
/// - log ở tầng dưới rồi ném tiếp cho tầng trên quyết định.
String _inner(List<String> log) {
  try {
    throw NetworkException('api/orders');
  } catch (e) {
    log.add('tầng dưới log: $e');
    rethrow;
  }
}

String outer(List<String> log) {
  try {
    return _inner(log);
  } on NetworkException catch (e) {
    return 'tầng trên xử lý: $e';
  }
}

/// Exception: lỗi dự kiến, nên bắt.
/// Error: lỗi lập trình — bắt được, nhưng đúng ra phải SỬA CODE.
String exceptionVsError() {
  try {
    [1, 2, 3].elementAt(10);
    return 'không tới đây';
  } catch (e) {
    return '${e.runtimeType} -> là Error, dấu hiệu code sai';
  }
}

/// Khi nào throw, khi nào trả null:
/// - "không tìm thấy" là kết quả bình thường -> trả null
/// - "không gọi được server" là bất thường -> throw
String? findUser(String id) => id == 'u1' ? 'chunhau' : null;

void main() {
  final log = <String>[];

  print('--- on X chỉ bắt đúng X ---');
  print('bắt sai loại : ${parseWrongCatch('12')}');
  try {
    print(parseWrongCatch('abc'));
  } catch (e) {
    print('bắt sai loại : THOÁT RA NGOÀI -> ${e.runtimeType}');
  }
  print('bắt đúng loại: ${parseRightCatch('abc')}');

  print('--- stacktrace & finally ---');
  print(withStackTrace(log));

  print('--- rethrow ---');
  print(outer(log));

  print('--- Exception vs Error ---');
  print(exceptionVsError());

  print('--- throw hay trả null ---');
  print('findUser(u1) = ${findUser('u1')}');
  print('findUser(u9) = ${findUser('u9')}');

  print('--- log ---');
  for (final line in log) {
    print('  $line');
  }
}
