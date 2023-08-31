import 'package:args/command_runner.dart';
import 'package:lab_aluno_cli/commands/students/subcommands/find_all_command.dart';

import 'package:lab_aluno_cli/repositories/student_repository.dart';

class StudentsCommand extends Command {
  @override
  String get description => 'Students operations';

  @override
  String get name => 'students';

  StudentsCommand() {
    final studentRepository = StudentRepository();
    addSubcommand(FindAllCommand(repository: studentRepository));
    // addSubcommand(FindByIdCommand());
  }
}
