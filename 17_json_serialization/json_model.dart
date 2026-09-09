import 'dart:convert';

class Address {
  final String city;
  final String? street; // field có thể thiếu trong JSON

  Address(this.city, this.street);

  factory Address.fromJson(Map<String, dynamic> json) =>
      Address(json['city'] as String? ?? 'không rõ', json['street'] as String?);

  Map<String, dynamic> toJson() => {'city': city, 'street': street};

  @override
  String toString() => '$city/${street ?? '-'}';
}

class User {
  final int id;
  final String name;
  final int age;
  final List<Address> addresses;

  User({
    required this.id,
    required this.name,
    required this.age,
    required this.addresses,
  });

  /// Dùng `factory` vì fromJson không chỉ gán field:
  /// nó phải ép kiểu, đặt mặc định, và dựng cả danh sách con.
  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['id'] as int? ?? 0,
    name: json['name'] as String? ?? 'Ẩn danh',
    age: json['age'] as int? ?? 0,
    addresses: (json['addresses'] as List<dynamic>? ?? [])
        .map((e) => Address.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'age': age,
    'addresses': addresses.map((a) => a.toJson()).toList(),
  };

  @override
  String toString() => 'User($id, $name, $age, $addresses)';
}

/// `jsonDecode` trả `dynamic` — ranh giới nguy hiểm nhất.
/// Ép sai kiểu thì compiler không cản, lỗi dời sang lúc chạy.
String dynamicDanger() {
  final raw = jsonDecode('{"age": "hai mươi"}') as Map<String, dynamic>;
  try {
    final age = raw['age'] as int; // thực tế là String
    return '$age';
  } catch (e) {
    return 'nổ lúc chạy: ${e.runtimeType}';
  }
}

const fullJson = '''
{
  "id": 1,
  "name": "An",
  "age": 20,
  "addresses": [
    {"city": "Hà Nội", "street": "Lê Lợi"},
    {"city": "Đà Nẵng"}
  ]
}
''';

const partialJson = '{"id": 2}';

void main() {
  print('--- decode đầy đủ ---');
  final user = User.fromJson(jsonDecode(fullJson) as Map<String, dynamic>);
  print(user);

  print('--- decode thiếu field ---');
  final u2 = User.fromJson(jsonDecode(partialJson) as Map<String, dynamic>);
  print(u2);

  print('--- encode ngược lại ---');
  print(jsonEncode(user.toJson()));

  print('--- cái bẫy dynamic ---');
  print(dynamicDanger());
}
