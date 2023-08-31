// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:args/command_runner.dart';

import 'package:lab_aluno_cli/repositories/student_repository.dart';

import 'dart:io';

class FindAllCommand extends Command {
  final StudentRepository repository;
  
  FindAllCommand({required this.repository});

  @override
  String get description => 'Find all Students';

  @override
  String get name => 'findAll';

  @override
  Future<void> run() async {
    print('buscando estudantes...');

    final students = await repository.findAll();
    print('deseja apresentar com os cursos?(S ou N)');
    final showCourses = stdin.readLineSync();
    print('---------------------------------');
    print('estudantes');
    print('---------------------------------');
    for (var student in students) {
      if (showCourses?.toLowerCase() == 's') {
        print('''${student.id} - ${student.name}
        ${student.courses.where((course) => course.isStutant == true).map((e) => e.name).toList()}
        
        ''');
      } else {
        print('${student.id} - ${student.name}');
      }
    }
  }
}
