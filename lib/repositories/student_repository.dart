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
    // return response;
  }

  Future<Student> findById(int id) async {
    final response = await client.get(url: '$url/$id');

    //O Dio ja retorna pra gente um Map, ele não retorna uma String,
    // portanto o .fromJson que converte uma String não funciona
    // return Student.fromJson(response); //=> packege http

    return Student.fromMap(response); //=> packege Dio
  }

  Future<void> insert(Student studant) async {
    await client.post(
      url: url,
      body: studant.toMap(),
      // body: studant.toJson(), //=> packege http, converte nosso objeto em json
      // headers: {'content-type': 'application/json'},=> não precisa com o dio packege
    );
  }

  Future<void> update(Student studant) async {
    await client.put(
      url: '$url/${studant.id}',
      // envia o objeto student como map e o proprio Dio converte para json
      body: studant.toMap(),
      // body: studant.toJson(), //=> packege http, converte nosso objeto em json
      // headers: {'content-type': 'application/json'},=> não precisa com o dio packege
    );
  }

  Future<void> deleteById(int id) async {
    await client.delete(url: '$url/$id');
  }
}
