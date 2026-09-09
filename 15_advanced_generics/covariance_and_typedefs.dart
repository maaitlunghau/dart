/// Generic Typedef:
/// - đặt bí danh cho kiểu Generic
/// - giúp rút ngắn các khai báo kiểu phức tạp (như Callback, Map cấu trúc)
typedef Mapper<Input, Output> = Output Function(Input item);
typedef JsonMap<V> = Map<String, V>;

/// dùng typedef làm tham số hàm
List<R> transformList<T, R>(List<T> list, Mapper<T, R> mapper) {
  return list.map(mapper).toList();
}

// Covariance:
// - kiểu con thay thế kiểu cha trong Generic
class Food {}

class Bone extends Food {}

abstract class Animal {
  /// Từ khoá `covariant`:
  /// - cho phép class con ghi đè tham số bằng KIỂU CON (Bone)
  /// - thay vì bắt buộc dùng KIỂU CHA (Food).
  void eat(covariant Food food);
}

class Dog extends Animal {
  @override
  void eat(Bone food) {
    print('Chó đang gặm xương');
  }
}

class Cat extends Animal {
  @override
  void eat(Food food) {}
}

/// Cái giá của `covariant`: an toàn kiểu bị dời sang lúc CHẠY.
/// Gọi qua biến kiểu cha với tham số kiểu cha -> nổ.
String covariantParamTrap() {
  final Animal a = Dog(); // kiểu tĩnh Animal, object thật Dog

  try {
    a.eat(Food()); // compiler cho qua vì chữ ký là eat(Food)
    return 'không nổ';
  } catch (e) {
    return 'nổ lúc chạy: ${e.runtimeType}';
  }
}

/// Cạm bẫy Covariance trên Collection lúc RUNTIME:
/// `List<Dog>` là subtype của `List<Animal>`, nhưng nạp sai phần tử sẽ crash!
String covarianceRuntimeTrap() {
  final List<Dog> dogList = [];
  final List<Animal> animalList =
      dogList; // Lập trình viên coi đây là List<Animal>

  try {
    // Compiler cho qua vì animalList khai kiểu List<Animal>,
    // nhưng ô nhớ thật là List<Dog> -> nổ lúc chạy.
    animalList.add(Cat());
    return 'không nổ';
  } catch (e) {
    return 'nổ lúc chạy: ${e.runtimeType}';
  }
}

void main() {
  print('--- Generic Typedef ---');
  final JsonMap<int> scores = {'Toán': 9, 'Văn': 8};
  print('JsonMap: $scores');

  final numbers = [1, 2, 3];
  final doubled = transformList<int, String>(numbers, (n) => 'Số $n');
  print('Mapper result: $doubled');

  print('--- Covariance ---');
  final dog = Dog();
  dog.eat(Bone()); // Hợp lệ, đúng kiểu Bone

  print('--- Covariance Trap ---');
  print('list  -> ${covarianceRuntimeTrap()}');
  print('param -> ${covariantParamTrap()}');
}
