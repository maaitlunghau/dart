/// Class cơ bản:
/// - field
/// - 3 loại constructor
/// - getter/setter
/// - private
class Person {
  final String name;
  final String code;
  int _age;

  static final Map<String, Person> _cache = {};

  /// Constructor thường
  /// - Initializer list (sau ':') chạy TRƯỚC thân constructor
  /// - chỗ duy nhất gán được field 'final'
  Person(this.name, int age) : code = 'P-$name', _age = age;

  /// Named Constructor
  /// - một class, nhiều cách khởi tạo
  Person.guest() : name = 'Guest', code = 'P-guest', _age = 0;

  /// Factory:
  /// - ĐƯỢC PHÉP trả về instance có sẵn thay vì luôn tạo mới
  /// - Constructor thường KHÔNG làm được điều này
  factory Person.cached(String name) {
    return _cache[name] ??= Person(name, 0);
  }

  int get age => _age;

  set age(int value) {
    if (value < 0) return;
    _age = value;
  }

  @override
  String toString() => '$code/$name/$_age';
}

class PersonPrinter {
  String reveal(Person p) => 'Print direct _age = ${p._age}';
}

void main() {
  final p = Person('An', 20);
  print('constructor thường  = $p');
  print('named constructor   = ${Person.guest()}');

  final a = Person.cached('Bình');
  final b = Person.cached('Bình');
  print('factory trả cùng object? = ${identical(a, b)}');

  p.age = -5;
  print('setter chặn -5      = ${p.age}');
  p.age = 30;
  print('setter nhận 30      = ${p.age}');

  print('library-private     = ${PersonPrinter().reveal(p)}');
}
