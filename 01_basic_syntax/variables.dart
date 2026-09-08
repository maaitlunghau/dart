/// var
/// - suy ra kiểu dữ liệu từ giá trị đầu tiên
/// - kiểu sẽ bị khoá từ đó về sau
String describeVar() {
  var greeting = 'Hello';
  greeting = "Hello, Dart";

  return greeting;
}

/// final
/// - chỉ được phép gán một lần
/// - được phép tính toán giá trị lúc Runtime (chạy chương trình)
/// => sự khác biệt so với keyword 'const'
int finalAtRunTime() {
  final year = DateTime.now().year;

  // const: cần giá trị ngay lúc biên dịch
  // const year2 = DateTime.now().year;

  // year: final chỉ được gán một lần
  // year = 2030;

  return year;
}

/// final: khoá 'tham chiếu' hay khoá 'nội dung' ?
List<int> addToFinalList() {
  final numbers = [1, 2];
  numbers.add(3); // cho phép, final KHÔNG khoá nội dung
  // numbers = [4, 5]; // không cho phép, final khoá THAM CHIẾU
  return numbers;
}

/// identical(a, b): hỏi hai bên có phải cùng một Object trong bộ nhớ không ?
/// - Dart gom mọi 'const' có cùng giá trị về cùng một Object duy nhất
/// - canonicalization: cơ chế 'const' widget của Flutter dựa vào để bỏ qua rebuild
bool constListsIdentical() {
  const a = [1, 2];
  const b = [1, 2];

  return identical(a, b); // true
}

bool literalListsIdentical() {
  return identical([1, 2], [1, 2]); // false
}

void main() {
  print('describeVar(): ${describeVar()}');
  print('finalAtRuntime(): ${finalAtRunTime()}');
  print('addToFinalList()        = ${addToFinalList()}');
  print('constListsIdentical()   = ${constListsIdentical()}');
  print('literalListsIdentical() = ${literalListsIdentical()}');
}
