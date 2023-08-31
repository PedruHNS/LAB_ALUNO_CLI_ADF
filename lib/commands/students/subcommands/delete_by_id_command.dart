import 'dart:async';
import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:lab_aluno_cli/repositories/student_repository.dart';

class DeleteByIdCommand extends Command {
  final StudentRepository repository;

  DeleteByIdCommand({required this.repository}) {
    argParser.addOption('id', help: 'Student ID', abbr: 'i');
  }
  @override
  String get description => 'Delete By ID Student';

  @override
  String get name => 'deleteById';

  @override
  Future<void> run() async {
    if (argResults?['id'] == null) {
      print('passe um id com o comando --id 0 ou -i 0');
      return;
    }
    final id = int.parse(argResults?['id']);
    await repository.deleteById(id);
    print('deletado com sucesso');
  }
}
