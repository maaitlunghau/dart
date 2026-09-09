/// Generic class:
/// - một class dùng cho mọi kiểu
/// - vẫn giữ an toàn
class Box<T> {
  final T value;

  Box(this.value);

  @override
  String toString() => 'Box<$T>($value)';
}

/// Hai tham số kiểu.
class Pair<K, V> {
  final K key;
  final V value;

  Pair(this.key, this.value);

  /// Đổi chỗ -> kiểu trả về cũng đảo theo.
  Pair<V, K> swapped() => Pair(value, key);

  @override
  String toString() => '($key, $value)';
}

/// Bounded type:
/// - `extends` ở đây là RÀNG BUỘC KIỂU, không phải kế thừa.
/// - nhờ ràng buộc, bên trong gọi được `compareTo`.
/// - dùng `Comparable<Object>` chứ không phải `Comparable<T>`: `int` implements `Comparable<num>`
/// - nên nó KHÔNG thoả `Comparable<int>`.
class Sorter<T extends Comparable<Object>> {
  List<T> sortDesc(List<T> items) {
    return [...items]..sort((a, b) => b.compareTo(a));
  }
}

/// Generic method độc lập - không cần class Generic.
T firstOr<T>(List<T> items, T fallback) {
  return items.isEmpty ? fallback : items.first;
}

/// `dynamic` vứt bỏ kiểm tra lúc biên dịch
/// - lỗi dời sang lúc chạy (Runtime).
class DynamicBox {
  final dynamic value;
  DynamicBox(this.value);
}

String dynamicCost() {
  final box = DynamicBox('hello');

  try {
    return '${box.value + 1}';
  } catch (e) {
    return 'lỗi lúc chạy: ${e.runtimeType}';
  }
}

void main() {
  print('--- Box<T> ---');
  print(Box<int>(42));
  print(Box<String>('xin chào'));

  print('--- Pair<K, V> ---');
  final p = Pair('tuổi', 20);
  print('$p -> swapped ${p.swapped()}');

  print('--- bounded type ---');
  print(Sorter<int>().sortDesc([3, 1, 2]));
  print(Sorter<String>().sortDesc(['b', 'c', 'a']));
  // Sorter<Box<int>>();  // lỗi: Box không implement Comparable

  print('--- generic method ---');
  print('firstOr(<int>[], -1)   = ${firstOr(<int>[], -1)}');
  print("firstOr(['a','b'],'z') = ${firstOr(['a', 'b'], 'z')}");

  print('--- cái giá của dynamic ---');
  print(dynamicCost());
  // Box<String>('hello').value + 1;  // lỗi BIÊN DỊCH, không đợi tới lúc chạy
}
