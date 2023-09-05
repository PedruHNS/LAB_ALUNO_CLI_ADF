

import 'package:args/command_runner.dart';

import 'package:lab_aluno_cli/repositories/product_repository.dart';

class FindByNameCommand extends Command {
  final ProductRepository repository;

  FindByNameCommand({required this.repository});

  @override
  String get description => throw UnimplementedError();

  @override
  String get name => throw UnimplementedError();

  // @override
  // Future<void> run() async{
  //   return super.run();
  // }
}
