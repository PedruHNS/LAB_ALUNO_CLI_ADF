import 'package:args/args.dart';
import 'package:args/command_runner.dart';
import 'package:lab_aluno_cli/commands/students/students_command.dart';

void main(List<String> args) {
  CommandRunner('ADF-ALUNO-CLI', 'testando o command runner')
    ..addCommand(StudentsCommand())
    ..run(args);
}
