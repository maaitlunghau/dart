/// int, double đều là num — nhưng Dart KHÔNG tự ép int sang double.
/// `/` luôn trả double, `~/` mới là chia lấy phần nguyên.
String numTypes() {
  int i = 7;
  double d = 7.0;
  num a = i; // num nhận int
  num b = d; // num nhận double
  // double x = i;  // lỗi: int không tự thành double

  return '${a.runtimeType} ${b.runtimeType} ${i / 2} ${i ~/ 2}';
}

/// Toán tử số học, so sánh, logic.
String operators(int a, int b) {
  final sum = a + b;
  final bigger = a > b;
  final bothPositive = a > 0 && b > 0;

  return '$sum $bigger $bothPositive';
}

/// `$x` chỉ dùng được cho định danh trơn.
/// Có phép tính, dấu chấm hay ngoặc thì bắt buộc `${...}`.
String interpolate(String name, int age) {
  return '$name sinh khoảng ${DateTime.now().year - age}';
}

/// if / else
String classify(int score) {
  if (score >= 8) {
    return 'Good';
  } else if (score >= 5) {
    return 'Average';
  } else {
    return 'Poor';
  }
}

/// for, for-in, while
List<int> loops() {
  final out = <int>[];
  for (var i = 1; i <= 3; i++) {
    out.add(i);
  }
  for (final x in [10, 20]) {
    out.add(x);
  }

  var n = 100;
  while (n < 300) {
    out.add(n);
    n += 100;
  }

  return out;
}

/// switch câu lệnh
/// - mỗi nhánh tự return/break.
String switchStatement(int day) {
  switch (day) {
    case 1:
      return 'Thứ hai';
    case 7:
      return 'Chủ nhật';
    default:
      return 'Ngày thường';
  }
}

/// switch BIỂU THỨC (Dart 3):
/// - trả thẳng ra giá trị, `_` là nhánh mặc định.
String switchExpression(int day) => switch (day) {
  1 => 'Thứ hai',
  7 => 'Chủ nhật',
  _ => 'Ngày thường',
};

void main() {
  print('numTypes()          = ${numTypes()}');
  print('operators(7, 3)     = ${operators(7, 3)}');
  print('interpolate()       = ${interpolate('An', 20)}');
  print('classify(9)         = ${classify(9)}');
  print('loops()             = ${loops()}');
  print('switchStatement(7)  = ${switchStatement(7)}');
  print('switchExpression(7) = ${switchExpression(7)}');
}
