/// List: giữ thứ tự và cho trùng
/// Set: loại dữ liệu trùng
/// Map: tra theo khoá.
String threeTypes() {
  final list = [1, 2, 2, 3];
  final set = {...list}; // dedupe từ list có trùng
  final map = {'a': 1, 'b': 2};

  return '$list / $set / ${map.keys}';
}

/// `Map<K, V>`: tham số ĐẦU là kiểu KHOÁ, không phải chỉ số
/// KHOÁ do mình đặt, không cần liên tục, ko có thứ tự như index
String mapKeys() {
  final byCode = <int, String>{101: 'Casio', 7: 'Sharp'};
  final list = ['a', 'b', 'c'];

  return '${byCode[101]} ${byCode[7]} | list[0] = ${list[0]}';
}

/// collection-if
/// collection-for
/// spread `...` và `...?`
List<int> buildList({required bool isVip, List<int>? extras}) {
  return [
    1, // 1. Phần tử cố định
    if (isVip) 99, // 2. Collection-if
    for (var i = 1; i <= 3; ++i) i * 10, // 3. Collection-for
    ...?extras, // 4. Spread operator an toàn với Null
  ];
}

/// Chuỗi where -> map -> toList
List<int> chain(List<int> nums) {
  return nums.where((n) => n.isEven).map((n) => n * 10).toList();
}

/// fold: gộp cả collection về một giá trị
int total(List<int> nums) => nums.fold(0, (acc, n) => acc + n);

/// Iterable: LAZY
/// - map KHÔNG CHẠY GÌ cho tới khi có người tiêu thụ
List<String> lazyDemo() {
  final log = <String>[];

  final lazy = [1, 2, 3].map((n) {
    log.add('handling $n');
    return n * 2;
  });

  log.add('>> đã tạo map, chưa toList');

  final result = lazy.toList(); // đây mới là lúc nó chạy

  log.add('>> toList xong: $result');
  return log;
}

void main() {
  print('threeTypes()  = ${threeTypes()}');
  print('mapKeys()     = ${mapKeys()}');
  print('buildList()   = ${buildList(isVip: true, extras: [7, 8])}');
  print('buildList()   = ${buildList(isVip: false)}');
  print('chain()       = ${chain([1, 2, 3, 4])}');
  print('total()       = ${total([1, 2, 3, 4])}');
  print('lazyDemo():');

  for (final line in lazyDemo()) {
    print('  $line');
  }
}
