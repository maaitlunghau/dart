class Paint {
  double width = 0;
  String color = 'black';
  bool antiAlias = false;

  @override
  String toString() => 'Paint(w:$width, c:$color, aa:$antiAlias)';
}

/// Không cascade:
/// - phải có biến tạm
/// - lặp lại tên nó 3 lần
Paint withoutCascade() {
  final p = Paint();

  p.width = 2;
  p.color = 'red';
  p.antiAlias = true;

  return p;
}

/// Có cascade:
/// - chỉ cần một biểu thức duy nhất
/// - không cần biến tạm
Paint withCascade() {
  return Paint()
    ..width = 2
    ..color = 'red'
    ..antiAlias = true;
}

/// Method có giá trị trả về (để so sánh `.` với `..`)
class Logger {
  final List<String> lines = [];

  int log(String s) {
    lines.add(s);
    return lines.length; // return int type
  }
}

/// `.` cho ra KẾT QUẢ của method -> int
Object dotReturns() => Logger().log('a');

/// `..` cho ra CHÍNH OBJECT -> Logger
Object cascadeReturns() => Logger()..log('a');

/// `?..` chỉ chạy khi object khác null
/// - null thì bỏ qua
/// - tránh nổ/crash chương trình
String nullSafeCascade(Paint? p) {
  p
    ?..width = 5
    ..color = 'blue';
  return p?.toString() ?? 'p is null -> cascade bị bỏ qua';
}

void main() {
  print('--- cùng kết quả, ít lặp hơn ---');
  print('withoutCascade() = ${withoutCascade()}');
  print('withCascade()    = ${withCascade()}');

  print('--- `.` vs `..` trả về gì ---');
  print('.  -> ${dotReturns().runtimeType}');
  print('.. -> ${cascadeReturns().runtimeType}');

  print('--- ?.. trên nullable ---');
  print(nullSafeCascade(Paint()));
  print(nullSafeCascade(null));
}
