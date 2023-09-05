import 'package:lab_aluno_cli/models/student.dart';
import 'package:lab_aluno_cli/services/http_client_interface.dart';

class StudentRepository {
  IHttpClient client;
  static final url = 'http://localhost:8080/students';

  StudentRepository({required this.client});

  Future<List<Student>> findAll() async {
    final response = await client.get(url: url);

    return response
        .map<Student>((student) => Student.fromMap(student))
        .toList();
  }

  Future<Student> findById(int id) async {
    final response = await client.get(url: '$url/$id');

    return Student.fromJson(response);
  }

  Future<void> insert(Student studant) async {
    await client.post(
        url: url,
        body: studant.toJson(),
        headers: {'content-type': 'application/json'});
  }

  Future<void> update(Student studant) async {
    await client.put(
      url: '$url/${studant.id}',
      body: studant.toJson(),
      headers: {'content-type': 'application/json'},
    );
  }

  Future<void> deleteById(int id) async {
    await client.delete(url: '$url/$id');
  }
}
