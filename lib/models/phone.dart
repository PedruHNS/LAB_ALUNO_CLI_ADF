import 'dart:convert';

class Phone {
  final int ddd;
  final String phone;

  Phone({
    required this.ddd,
    required this.phone,
  });

  Map<String, dynamic> toMap() {
    return {
      'ddd': ddd,
      'phone': phone,
    };
  }

  String toJson() => jsonEncode(toMap());

  factory Phone.fromMap(Map<String, dynamic> map) {
    return Phone(
      ddd: map['ddd'] ?? 0,
      phone: map['phone'] ?? "",
    );
  }

  factory Phone.fromJson(String json) => Phone.fromMap(jsonDecode(json));
}
