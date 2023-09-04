// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:args/command_runner.dart';

import '../../../repositories/student_repository.dart';

class UpdateCommand extends Command {
  final StudentRepository repository;
  UpdateCommand({
    required this.repository,
  });
  @override
  String get description => 'Update Students';

  @override
  String get name => 'update';
  // @override
  // Future<void> run() {
  //   // TODO: implement run

  // }
}
