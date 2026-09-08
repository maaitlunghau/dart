/// 'String?'
/// - kiểu dữ liệu có thể null
/// - 'String' là kiểu dữ liệu không thể null.
String nullableVsNot() {
  String? maybe;
  String sure = "have value";

  return '$maybe / $sure';
}

/// '??' và '?.'
/// - '??': lấy giá trị thay thế khi null
/// - '?.': gọi an toàn, null thì trả về null
String defaults(String? name) {
  final display = name ?? "Guest";
  final len = name?.length;

  return '$display / $len';
}

/// '??='
/// - chỉ gán khi biến đang null
/// - nếu biến đang null -> gán giá trị
/// - nếu biến đã có giá trị -> giữ nguyên giá trị trước đó
String assignIfNull(String? name) {
  // if (name == null) {
  //   name = "default";
  // }
  name ??= "default";
  return name;
}

/// Type promotion:
/// - tính năng thông minh của trình biên dịch Dart (Sound Null Safety)
/// - không cần dùng tới '!' như trước (ép kiểu thủ công, khẳng định biến không null)
/// - Dart sẽ tự động coi biến đó là kiểu không-null (String)
int promoted(String? s) {
  if (s == null) return 0;
  return s.length;
}

/// '!'
/// - khẳng định chắc chắn không null
/// - sai thì lỗi lúc Runtime
String forceNull() {
  String? s;

  try {
    return s!.length.toString();
  } catch (e) {
    return e.runtimeType.toString();
  }
}

/// 'late'
/// - KHÔNG phải nullable, chỉ hoãn việc gán giá trị
/// - CHO PHÉP khai báo biến không có giá trị lúc khởi tạo
late String token;

/// Biến top-level
/// - 'late' đọc trước khi gán -> lỗi Runtime
/// - biến local 'late' thì compiler chặn ngay lúc biên dịch
String lateBeforeAssign() {
  try {
    return token;
  } catch (e) {
    return e.runtimeType.toString();
  }
}

String lateAfterAssign() {
  token = 'abc123';
  return token;
}

void main() {
  print('nullableVsNot()     = ${nullableVsNot()}');
  print('defaults(null)      = ${defaults(null)}');
  print('defaults("An")      = ${defaults('An')}');
  print('assignIfNull(null)  = ${assignIfNull(null)}');
  print('promoted("hello")   = ${promoted('hello')}');
  print('forceNull()         = ${forceNull()}');
  print('lateBeforeAssign()  = ${lateBeforeAssign()}');
  print('lateAfterAssign()   = ${lateAfterAssign()}');
}
