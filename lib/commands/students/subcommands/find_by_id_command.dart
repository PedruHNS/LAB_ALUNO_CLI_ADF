import 'dart:async';
import 'dart:io';

import 'package:args/command_runner.dart';

import '../../../repositories/student_repository.dart';

class FindByIdCommand extends Command {
  final StudentRepository repository;

  FindByIdCommand({required this.repository}) {
    argParser.addOption(
      'id',
      help: 'Student ID',
      abbr: 'i',
    );
  }

  @override
  String get description => 'Find By ID Student';

  @override
  String get name => 'findById';

  @override
  Future<void> run() async {
    if (argResults?['id'] == null) {
      print('envie um id com o comando --id 0 ou -i 0');
      return;
    }
    final id = int.parse(argResults?['id']);

    final student = await repository.findById(id);

    print('deseja mostrar os cursos do $id ? (S ou N)');
    final showCourses = stdin.readLineSync();
    if (showCourses?.toLowerCase() == 's') {
      print('''${student.id} - ${student.name}
        ${student.courses.where((element) => element.isStudent).map((e) => e.name).toList()}''');
    } else {
      print('${student.id} - ${student.name}');
    }
  }
}
