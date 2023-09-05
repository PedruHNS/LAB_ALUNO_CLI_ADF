// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:lab_aluno_cli/models/address.dart';
import 'package:lab_aluno_cli/models/city.dart';

import 'package:lab_aluno_cli/models/student.dart';
import 'package:lab_aluno_cli/repositories/product_repository.dart';

import '../../../models/phone.dart';
import '../../../repositories/student_repository.dart';

class UpdateCommand extends Command {
  final StudentRepository repository;
  final productRepository = ProductRepository();
  UpdateCommand({required this.repository}) {
    argParser.addOption('file', help: 'path of the csv file', abbr: 'f');
    argParser.addOption('id', help: 'Student ID', abbr: 'i');
  }
  @override
  String get description => 'Update Students';

  @override
  String get name => 'update';

  @override
  Future<void> run() async {
    //receber o path passado pelo command
    final filepath = argResults?['file'];
    final id = argResults?['id'];
    if (id == null) print('digite o ID -i 0');
    print('aguarde...');
    // passar o path para class File para localizar o arquivo
    // chamar o '.readAsLinesSync' para ler linha por linha do arquivo
    final students = File(filepath).readAsLinesSync();
    print('||||||||||||||||||||||||||||||||||||||||||');

    if (students.length > 1) {
      print('informe apenas um aluno no arquivo $filepath');
      return;
    } else if (students.isEmpty) {
      print('informa um aluno no arquivo $filepath');
      return;
    }

    var student = students.first;

    // quebramos a string no ';' transformando na lista.
    final studentData = student.split(';');
    // na posição 2 da lista studentData quebrando outra lista no ',',
    // retiramos o espaço do começo e do final.
    // convertemos o iterable em list
    final courseData = studentData[2].split(',').map((e) => e.trim()).toList();

    //vamos mapear todos os item que temos dentro da lista courseData
    final courseFutures = courseData.map((e) async {
      //chamamos o repository passando o nome do elemento da lista
      final course = await productRepository.findByName(e);
      // se o element (e) for encontrado então
      //course.isStudent é verdadeiro se não falso
      course.isStudent = true;
      return course;
    }).toList();

    // pedimos pro future.wait esperar o courseFutures termianr
    // de processar todos os coursos.
    final courses = await Future.wait(courseFutures);

    //agora vamos passar todas as conversões pro modelo.
    // temos o studentData com toda as informações do estudant
    // temos o courseDAta com as informações dos cursos
    // temos o course com informaçoes dos cursos matriculados
    final studentModel = Student(
      id: int.parse(id),
      name: studentData[0],
      age: int.tryParse(studentData[1]),
      nameCourses: courseData,
      courses: courses,
      address: Address(
        street: studentData[3],
        number: int.parse(studentData[4]),
        zipCode: studentData[5],
        city: City(id: 1, name: studentData[6]),
        phone: Phone(
          ddd: int.parse(studentData[7]),
          phone: studentData[8],
        ),
      ),
    );
    await repository.update(studentModel);

    print('aluno ${studentData[0]}($id) atualizado com sucesso');
  }
}
