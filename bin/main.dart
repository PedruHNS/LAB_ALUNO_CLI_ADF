import 'package:args/args.dart';
import 'package:args/command_runner.dart';

void main(List<String> args) {
  // final argParser = ArgParser();

  // argParser.addFlag('data', abbr: 'd');
  // argParser.addOption('name', abbr: 'n');
  // argParser.addOption('template', abbr: 't');

  // final argResult = argParser.parse(args);

  // print('${argResult['data']}');
  // print('${argResult['name']}');
  // print('${argResult['template']}');

  CommandRunner('ADF-ALUNO-CLI', 'testando o command runner')
    ..addCommand(ExemploCommand())
    ..run(args);
}

class ExemploCommand extends Command {
  @override
  String get description => 'exemplo de comando';

  @override
  String get name => 'exemplo';

  ExemploCommand() {
    argParser.addOption('template',
        abbr: 't', help: 'template de criação do projeto');
  }

  @override
  void run() {
    print(argResults?['template']);
    print('executa oque eu quiser');
  }
}
