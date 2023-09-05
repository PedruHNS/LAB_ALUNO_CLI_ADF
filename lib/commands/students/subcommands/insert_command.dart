// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:lab_aluno_cli/models/address.dart';
import 'package:lab_aluno_cli/models/city.dart';

import 'package:lab_aluno_cli/models/phone.dart';
import 'package:lab_aluno_cli/models/student.dart';

import 'package:lab_aluno_cli/repositories/product_repository.dart';

import '../../../repositories/student_repository.dart';

class InsertCommand extends Command {
  final StudentRepository repository;
  final productRepository = ProductRepository();

  InsertCommand({required this.repository}) {
    argParser.addOption(
      'file',
      help: 'Path of the csv file',
      abbr: 'f',
    );
  }
  @override
  String get description => 'Insert Student';

  @override
  String get name => 'insert';

  @override
  Future<void> run() async {
    final filePath = argResults?['file'];
    print('aguarde');
    //! o File serve para ler um path passamos '.readAsLineSync' ler as linhas sincronas
    final students = File(filePath).readAsLinesSync();
    print('|||||||||||||||||||||||||||||||||||||||||||||||||||');
    for (var student in students) {
      final studentData = student.split(';');
      // "trim()" remove os espaços do começo e do final
      final courseData =
          studentData[2].split(',').map((e) => e.trim()).toList();

      final courseFutures = courseData.map((c) async {
        final course = await productRepository.findByName(c);
        course.isStudent = true;
        return course;
      }).toList();

      final courses = await Future.wait(courseFutures);

      final studentModel = Student(
        name: studentData[0],
        age: int.tryParse(studentData[1]),
        nameCourses: courseData,
        courses: courses,
        address: Address(
          street: studentData[3],
          number: int.parse(studentData[4]),
          zipCode: studentData[5],
          city: City(id: 1, name: studentData[6]),
          phone: Phone(ddd: int.parse(studentData[7]), phone: studentData[8]),
        ),
      );

      await repository.insert(studentModel);
    }
    print('inserido com sucesso');
    // final insert = await repository.insert(studant);
  }
}
