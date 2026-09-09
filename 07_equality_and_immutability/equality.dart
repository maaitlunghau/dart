/// Không override gì
/// - Dart mặc định so sánh IDENTITY (cùng ô nhớ), không so nội dung
/// - đây đúng là 'Account' trong '_archive/assignment_02'
class Account {
  final String code;
  Account(this.code);
}

/// Override '==' mà QUÊN 'hashCode'
/// '==' đúng nhưng Set/Map hỏng âm thầm
/// '// ignore' để giữ lỗi này cố ý
class BrokenPoint {
  final int x;
  BrokenPoint(this.x);

  @override
  // ignore: hash_and_equals
  bool operator ==(Object other) {
    return other is BrokenPoint && other.x == x;
  }
}

/// Value object đúng chuẩn
/// '==' và 'hashCode' luôn đi cùng nhau
/// Toàn bộ field 'final' -> khai được 'const' constructor
class Point {
  final int x;
  final int y;

  const Point(this.x, this.y);

  @override
  bool operator ==(Object other) {
    return other is Point && other.x == x && other.y == y;
  }

  @override
  int get hashCode => Object.hash(x, y);

  /// Bất biến (Immutability):
  /// - không sửa tại chỗ
  /// - tạo bản mới có đổi vài field
  Point copyWith({int? x, int? y}) => Point(x ?? this.x, y ?? this.y);

  @override
  String toString() => '($x, $y)';
}

void main() {
  print('--- Set có gộp trùng không ---');
  print(
    'Account  (không có ==/hashCode) = ${{Account('A01'), Account('A01')}.length}',
  );
  print(
    'Broken   (chỉ có ==)           = ${{BrokenPoint(1), BrokenPoint(1)}.length}',
  );
  print(
    'Point    (đủ cả hai)           = ${{Point(1, 2), Point(1, 2)}.length}',
  );

  print('--- so sánh bằng == ---');
  print('Account  = ${Account('A01') == Account('A01')}');
  print('Broken   = ${BrokenPoint(1) == BrokenPoint(1)}');
  print('Point    = ${Point(1, 2) == Point(1, 2)}');

  print('--- const canonicalization ---');
  print('const/const = ${identical(const Point(1, 2), const Point(1, 2))}');
  print('new/new     = ${identical(Point(1, 2), Point(1, 2))}');

  print('--- copyWith ---');
  const p = Point(1, 2);
  print('$p -> ${p.copyWith(y: 9)}');
}
