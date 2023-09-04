import 'package:args/command_runner.dart';
import 'package:lab_aluno_cli/repositories/product_repository.dart';

import 'find_by_name_command.dart';

class ProductCommand extends Command {
  @override
  String get description => 'Products Operations';

  @override
  String get name => 'products';

  ProductCommand() {
    final productRepository = ProductRepository();
    addSubcommand(FindByNameCommand(repository: productRepository));
  }
}
