import 'dart:convert';

class Course {
  final int id;
  final String name;
  final bool isStutant;

  Course({
    required this.id,
    required this.name,
    required this.isStutant,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'isStutant': isStutant,
    };
  }

  String toJson() => jsonEncode(toMap());

  factory Course.fromMap(Map<String, dynamic> map) {
    return Course(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      isStutant: map['isStutant'] ?? false,
    );
  }

  factory Course.fromJson(String json) => Course.fromMap(jsonDecode(json));
}
