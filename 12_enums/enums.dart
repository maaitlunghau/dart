/// Enum thường
enum Status { active, banned, pending }

/// Enhanced enum
/// - gắn dữ liệu & hành vi vào từng giá trị
/// - Constructor bắt buộc `const`
/// - field khai sau dấu `;`
enum Role {
  admin('Quản trị', 3),
  editor('Biên tập', 2),
  viewer('Người xem', 1);

  final String label;
  final int level;

  const Role(this.label, this.level);

  bool get canDelete => level >= 3;
}

/// `switch`
///  - biểu thức trên enum là EXHAUSTIVE:
/// - thiếu một nhánh là compiler báo ngay, không cần `default`.
String describe(Status s) => switch (s) {
  Status.active => 'Đang hoạt động',
  Status.banned => 'Bị khoá',
  Status.pending => 'Chờ duyệt',
};

/// Cùng việc đó bằng Magic String
String describeByString(String s) {
  if (s == 'active') return 'Đang hoạt động';
  if (s == 'banned') return 'Bị khoá';

  return 'Không rõ'; // 'activee' -> rơi vào đây
}

void main() {
  print('--- enum thường ---');
  print('values = ${Status.values}');
  print('name   = ${Status.active.name}');
  print('index  = ${Status.active.index}');

  print('--- switch exhaustive ---');
  for (final s in Status.values) {
    print('${s.name.padRight(8)} -> ${describe(s)}');
  }

  print('--- enum vs magic string ---');
  print("describeByString('active')  = ${describeByString('active')}");
  print("describeByString('activee') = ${describeByString('activee')}");
  // describe(Status.activee); // gõ sai enum -> lỗi BIÊN DỊCH

  print('--- enhanced enum ---');
  for (final r in Role.values) {
    print(
      '${r.name.padRight(7)} ${r.label.padRight(10)} level=${r.level} canDelete=${r.canDelete}',
    );
  }
}
