/// Named parameter: bắt buộc gọi kèm tên
/// - 'required': không được thiếu
/// - 'age = 0': có default thì được bỏ qua
String greet({required String name, int age = 0}) => "Hello $name, $age";

/// Optional positional:
/// - '[...]' được bỏ qua, nhưng phải đúng thứ tự
/// - tham số trong [...] phải nullable HOẶC có default
String describe(String name, [String? nickname]) {
  return nickname == null ? name : '$name ($nickname)';
}

/// Function là first-class:
/// - truyền được như một tham số bình thường
int twice(int x) => x * 2;
int applyTwice(int x, int Function(int) f) => f(f(x));

/// Closure
/// - 'count' vẫn sống sau khi makeCounter() đã kết thúc.
/// - Dấu hiệu nhận biệt: nếu hàm con mượn/dùng một biến ở bên ngoài phạm vi của nó.
int Function() makeCounter() {
  var count = 0;
  return () => ++count;
}

void main() {
  print(greet(name: 'An'));
  print(greet(name: 'Bình', age: 20));
  print(greet(age: 20, name: "maaitlunghau"));

  print(describe('An'));
  print(describe('An', 'Ăn'));

  print(applyTwice(5, twice));
  print(applyTwice(5, (n) => n + 1));

  final counter = makeCounter();
  final counter2 = makeCounter();

  print('${counter()} ${counter()} ${counter()}'); // 1 2 3
  print('$counter() $counter() $counter()');
  print('${counter2()}'); // 1
}
