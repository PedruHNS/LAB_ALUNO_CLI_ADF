// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:args/command_runner.dart';

import '../../../repositories/student_repository.dart';

class InsertCommand extends Command {
  final StudentRepository repository;
  InsertCommand({required this.repository}) {
    //argParser.addMultiOption(name);
    argParser.addOption(
      'name',
      abbr: 'n',
      help: 'Student name',
    );

    argParser.addOption(
      'age',
      abbr: 'a',
      help: 'Student name',
    );

    argParser.addOption(
      'listcourses',
      abbr: 'l',
      help: 'Student list courses',
    );

    argParser.addOption(
      'courses',
      abbr: 'c',
      help: 'Student courses',
    );

    argParser.addOption(
      'address',
      abbr: 'A',
      help: 'Student address',
    );
  }
  @override
  String get description => 'Insert Student';

  @override
  String get name => 'insert';

  @override
  Future<void> run() async {
    if (argResults?['id'] == null) {
      print('passe o ID do estudante -id 0 ou --i 0');
      return;
    }
    // final insert = await repository.insert(studant);
  }
}
