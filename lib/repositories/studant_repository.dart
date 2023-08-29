import 'dart:convert';

import 'package:lab_aluno_cli/models/studant.dart';
import 'package:http/http.dart' as http;

class StudantRepository {
  static final url = 'http://localhost:8080/studants';
  Future<List<Studant>> findAll() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode != 200) {
      throw Exception('erro ao acessar o servidor');
    }

    final responseData = jsonDecode(response.body);

    return responseData
        .map<Studant>((studant) => Studant.fromMap(studant))
        .toList();
  }

  Future<Studant> findById(int id) async {
    final response = await http.get(Uri.parse('$url/$id'));

    if (response.statusCode != 200) {
      throw Exception('erro ao fazer a requisição');
    }

    if (response.body == '{}') {
      throw Exception('ID invalido');
    }

    return Studant.fromJson(response.body);
  }

  Future<void> insert(Studant studant) async {
    final response = await http.post(Uri.parse(url),
        body: studant.toJson(), headers: {'content-type': 'application/json'});

    if (response.statusCode != 200) {
      throw Exception('erro na requisicao');
    }
  }

  Future<void> update(Studant studant) async {
    final response = await http.post(Uri.parse('$url/${studant.id}'),
        body: studant.toJson(), headers: {'content-type': 'application/json'});

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
