/// Thêm hành vi cho String
/// - không cần kế thừa
/// - không cần wrapper
extension StringX on String {
  bool get isValidEmail => contains('@') && contains('.');

  String get capitalized =>
      isEmpty ? this : '${this[0].toUpperCase()}${substring(1)}';
}

/// Extension trên int.
extension IntX on int {
  String toCurrency() {
    return '${toString().replaceAllMapped(RegExp(r'(\d)(?=(\d{3})+$)'), (m) => '${m[1]}.')}đ';
  }
}

class Product {
  final String name;
  final int price;
  Product(this.name, this.price);
}

/// Extension trên class của mình:
/// - giữ class gọn
/// - tách phần hiển thị ra ngoài
extension ProductX on Product {
  String get label => '${name.capitalized} - ${price.toCurrency()}';
}

// Extension KHÔNG PHẢI đa hình
class Animal {
  /// Method thật:
  /// - phân giải lúc CHẠY theo object thật -> đa hình.
  String name() => 'Animal';
}

class Dog extends Animal {
  @override
  String name() => 'Dog';
}

extension AnimalX on Animal {
  /// Extension:
  /// - phân giải lúc BIÊN DỊCH theo kiểu tĩnh của biến.
  String speak() => 'AnimalX';
}

extension DogX on Dog {
  String speak() => 'DogX';
}

void main() {
  print('--- extension trên String ---');
  print("'a@b.com'.isValidEmail = ${'a@b.com'.isValidEmail}");
  print("'abc'.isValidEmail     = ${'abc'.isValidEmail}");
  print("'dart'.capitalized     = ${'dart'.capitalized}");

  print('--- extension trên int ---');
  print('1250000.toCurrency() = ${1250000.toCurrency()}');

  print('--- extension trên class của mình ---');
  print(Product('bàn phím', 1250000).label);

  print('--- method thật vs extension ---');
  Animal a = Dog(); // kiểu TĨNH là Animal, object THẬT là Dog
  print('a.name()  = ${a.name()}   <- đa hình, theo object thật');
  print('a.speak() = ${a.speak()}  <- extension, theo kiểu tĩnh');
  print('(a as Dog).speak() = ${(a as Dog).speak()}');
}
