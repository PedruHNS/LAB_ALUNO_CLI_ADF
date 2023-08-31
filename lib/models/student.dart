import 'dart:convert';

import 'package:lab_aluno_cli/models/address.dart';
import 'package:lab_aluno_cli/models/course.dart';

class Student {
  final int? id;
  final String name;
  final int? age;
  final List<String> nameCourses;
  final List<Course> courses;
  final Address address;

  Student({
    this.id,
    required this.name,
    this.age,
    required this.nameCourses,
    required this.courses,
    required this.address,
  });

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = {
      'id': id,
      'name': name,
      'nameCourses': nameCourses,
      //abaixo temos uma lsita de objetos, então devemos percorrer
      // cada objeto dessa lista, transformando eles em Map
      'courses': courses.map((course) => course.toMap()).toList(),
      'address': address.toMap(),
    };

    if (age != null) {
      map['age'] = age;
    }
    return map;
  }

  String toJson() => jsonEncode(toMap());

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      //aqui fizemos a conversão de uma lista dynamic para String
      nameCourses: List<String>.from(map['nameCourses'] ?? <String>[]),
      courses: map['courses']
              ?.map<Course>((courseMap) => Course.fromMap(courseMap))
              .toList() ??
          <Course>[],
      address: Address.fromMap(map['address'] ?? <String, dynamic>{}),
    );
  }

  factory Student.fromJson(String json) => Student.fromMap(jsonDecode(json));
}
