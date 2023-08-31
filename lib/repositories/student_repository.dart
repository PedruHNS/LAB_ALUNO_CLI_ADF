import 'dart:convert';

import 'package:lab_aluno_cli/models/studant.dart';
import 'package:http/http.dart' as http;

class StudentRepository {
  static final url = 'http://localhost:8080/studants';
  Future<List<Student>> findAll() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode != 200) {
      throw Exception('erro ao acessar o servidor');
    }

    final responseData = jsonDecode(response.body);

    return responseData
        .map<Student>((studant) => Student.fromMap(studant))
        .toList();
  }

  Future<Student> findById(int id) async {
    final response = await http.get(Uri.parse('$url/$id'));

    if (response.statusCode != 200) {
      throw Exception('erro ao fazer a requisição');
    }

    if (response.body == '{}') {
      throw Exception('ID invalido');
    }

    return Student.fromJson(response.body);
  }

  Future<void> insert(Student studant) async {
    final response = await http.post(Uri.parse(url),
        body: studant.toJson(), headers: {'content-type': 'application/json'});

    if (response.statusCode != 200) {
      throw Exception('erro na requisicao');
    }
  }

  Future<void> update(Student studant) async {
    final response = await http.put(
      Uri.parse('$url/${studant.id}'),
      body: studant.toJson(),
      headers: {'content-type': 'application/json'},
    );

    if (response.statusCode != 200) {
      throw Exception('erro na requisição');
    }
  }

  Future<void> deleteById(int id) async {
    final response = await http.delete(Uri.parse('$url/$id'));

    if (response.statusCode != 200) {
      throw Exception('erro na requisição');
    }
  }
}
