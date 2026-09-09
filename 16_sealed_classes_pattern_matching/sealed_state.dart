/// `sealed`: compiler biết TRỌN BỘ subclass (chỉ khai được trong file này),
/// nhờ vậy kiểm tra được `switch` đã đủ nhánh chưa.
///
/// Khác enum: mỗi trạng thái mang dữ liệu RIÊNG, không cùng một bộ field.
sealed class LoadState {}

class Loading extends LoadState {}

class Success extends LoadState {
  final List<String> items;
  Success(this.items);
}

class Failure extends LoadState {
  final String message;
  final int code;

  Failure(this.message, this.code);
}

/// `switch` biểu thức + destructuring:
/// lấy dữ liệu ra ngay trong `case`, không cần `is` rồi cast thủ công.
String render(LoadState s) => switch (s) {
  Loading() => 'đang tải...',
  Success(items: final items) => 'có ${items.length} mục: $items',
  Failure(message: final m, code: final c) => 'lỗi $c: $m',
};

/// Cách cũ: `is` rồi cast. Dài hơn, và thiếu nhánh thì không ai báo.
String renderOldWay(LoadState s) {
  if (s is Loading) return 'đang tải...';
  if (s is Success) return 'có ${s.items.length} mục: ${s.items}';
  if (s is Failure) return 'lỗi ${s.code}: ${s.message}';

  return 'không rõ'; // nhánh này tồn tại chỉ vì compiler không giúp được
}

/// `when` = điều kiện phụ. `Failure(code: 404)` = khớp hằng số.
/// Nhánh cụ thể phải đặt TRƯỚC nhánh tổng quát.
String renderSmart(LoadState s) => switch (s) {
  Loading() => 'đang tải...',
  Success(items: final items) when items.isEmpty => 'chưa có dữ liệu',
  Success(items: final items) => 'có ${items.length} mục',
  Failure(code: 404) => 'không tìm thấy',
  Failure(message: final m) => 'lỗi: $m',
};

void main() {
  final states = <LoadState>[
    Loading(),
    Success(['a', 'b']),
    Success([]),
    Failure('mất mạng', 500),
    Failure('sai đường dẫn', 404),
  ];

  print('--- switch biểu thức + destructuring ---');
  for (final s in states) {
    print('${s.runtimeType.toString().padRight(8)} -> ${render(s)}');
  }

  print('--- cách cũ với is + cast ---');
  print(renderOldWay(Success(['x'])));

  print('--- when + hằng số ---');
  for (final s in states) {
    print('${s.runtimeType.toString().padRight(8)} -> ${renderSmart(s)}');
  }
}
