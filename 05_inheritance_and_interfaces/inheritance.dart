import 'dart:math';

/// abstract class:
/// - KHÔNG tạo instance trực tiếp
/// 'area()' không có thân hàm -> tự động là abstract, ko cần thêm keyword nào
/// 'describe()' có thân hàm -> class con 'extends' được dùng lại thoải mái
abstract class Shape {
  double area();

  String describe() => 'Area ${area().toStringAsFixed(2)}';
}

abstract class Printable {
  String label();
}

/// extends:
/// - kế thừa cả phần đã cài đặt
/// - chỉ override lại cái abstract
class Circle extends Shape {
  final double r;
  Circle(this.r);

  @override
  double area() => pi * r * r;
}

/// extends nhưng vẫn được phép override cả method đã có thân hàm sẵn
class Square extends Shape {
  final double side;
  Square(this.side);

  @override
  double area() => side * side;

  @override
  String describe() => 'Hình vuông cạnh $side';
}

/// implements:
/// - chỉ lấy CHỮ KÝ, không lấy phần cài đặt
/// - 'describe()' dù đã có thân hàm trong Shape, vẫn phải viết lại từ đầu
/// - implements được NHIỀU interface, extends chỉ được một
class Sticker implements Shape, Printable {
  @override
  double area() => 1;

  @override
  String describe() => 'Sticker cố định';

  @override
  String label() => 'STICKER';
}

/// Đa hình (polymorphism):
/// - nhận kiểu cha, chạy ra hành vi của object con thật sự
double totalArea(List<Shape> shapes) {
  var sum = 0.0;
  for (final s in shapes) {
    sum += s.area();
  }

  return sum;
}

void main() {
  final shapes = <Shape>[Circle(1), Square(2), Sticker()];

  for (final s in shapes) {
    print('${s.runtimeType} -> ${s.describe()}');
  }

  print('totalArea = ${totalArea(shapes).toStringAsFixed(2)}');
}
