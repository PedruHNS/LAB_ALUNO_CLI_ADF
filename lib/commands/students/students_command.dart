import 'package:args/command_runner.dart';
import 'package:lab_aluno_cli/commands/students/subcommands/delete_by_id_command.dart';
import 'package:lab_aluno_cli/commands/students/subcommands/find_all_command.dart';
import 'package:lab_aluno_cli/commands/students/subcommands/insert_command.dart';
import 'package:lab_aluno_cli/commands/students/subcommands/update_command.dart';

import 'package:lab_aluno_cli/repositories/student_repository.dart';
import 'package:lab_aluno_cli/services/http_packege.dart';

import 'subcommands/find_by_id_command.dart';

class StudentsCommand extends Command {
  @override
  String get description => 'Students operations';

  @override
  String get name => 'students';

  StudentsCommand() {
    final studentRepository = StudentRepository(client: HttpPackege());

    addSubcommand(FindAllCommand(repository: studentRepository));
    addSubcommand(FindByIdCommand(repository: studentRepository));
    addSubcommand(InsertCommand(repository: studentRepository));
    addSubcommand(UpdateCommand(repository: studentRepository));
    addSubcommand(DeleteByIdCommand(repository: studentRepository));
  }
}
