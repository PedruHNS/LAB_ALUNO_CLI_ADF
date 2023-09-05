import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/course.dart';

class ProductRepository {
  //metodo futuro para buscar um Course no servidor através do name
  Future<Course> findByName(String name) async {
    final url = 'http://localhost:8080/products?name=$name';
    final response = await http.get(Uri.parse(url));

    //verificando se o acesso ao serviço é sucesso (statusCode)
    if (response.statusCode != 200) {
      throw Exception('erro ao acessar o serviço');
    }
    // estamos decodificando o corpo do json
    final responseData = jsonDecode(response.body);

    if (responseData.isEmpty) {
      throw Exception('curso não encontrado');
    }

    return Course.fromMap(responseData.first);
  }
}
