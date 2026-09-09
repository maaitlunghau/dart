/// Mixin:
/// - hành vi dùng chung
/// - gắn chung vào class KHÔNG cùng dòng dõi.
mixin Loggable {
  final List<String> logs = [];

  void log(String msg) => logs.add('[$runtimeType] $msg');
}

/// Robot và Invoice:
/// - không họ hàng gì với nhau
/// - vẫn dùng chung Loggable
/// - đơn kế thừa không làm được điều này
class Robot with Loggable {
  void move() => log('Robot đang di chuyển');
}

class Invoice with Loggable {
  void pay() => log('Đã thanh toán hoá đơn');
}

// ---------------------------------------------
// Linearization: mixin sau đè mixin trước
// ---------------------------------------------
mixin A {
  String who() => 'A';
}

mixin B {
  String who() => 'B';
}

class AB with A, B {} // B đứng sau -> B thắng

class BA with B, A {} // A đứng sau -> A thắng

// ---------------------------------------------
// `mixin X on Y`: giới hạn nơi được gắn
// ---------------------------------------------
class Base {
  String speak() => 'hello';
}

/// `on Base`:
/// - chỉ gắn được vào Base hoặc con của Base.
/// - nhờ ràng buộc đó, mixin gọi được `super.speak()`.
mixin Shout on Base {
  @override
  String speak() => '${super.speak().toUpperCase()}!';
}

class Loud extends Base with Shout {}

// class NotBase with Shout {} // lỗi: Shout chỉ được gắn vào Base

void main() {
  print('--- chia sẻ hành vi ngang ---');
  final r = Robot()..move(); // cascade notation
  final i = Invoice()..pay(); // cascade notation
  print(r.logs);
  print(i.logs);

  print('--- linearization ---');
  print('class AB with A, B -> ${AB().who()}');
  print('class BA with B, A -> ${BA().who()}');

  print('--- mixin on + super ---');
  print('Base().speak() = ${Base().speak()}');
  print('Loud().speak() = ${Loud().speak()}');
}
