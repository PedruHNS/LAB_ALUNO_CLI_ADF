import 'dart:convert';

class Course {
  final int id;
  final String name;
  final bool isStudent;

  Course({
    required this.id,
    required this.name,
    required this.isStudent,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'isStutdent': isStudent,
    };
  }

  String toJson() => jsonEncode(toMap());

  factory Course.fromMap(Map<String, dynamic> map) {
    return Course(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      isStudent: map['isStudent'] ?? false,
    );
  }

  factory Course.fromJson(String json) => Course.fromMap(jsonDecode(json));
}
