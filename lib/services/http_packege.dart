import 'dart:convert';

import 'package:http/http.dart';

import 'package:lab_aluno_cli/services/http_client_interface.dart';

class HttpPackege implements IHttpClient {
  final client = Client();

  @override
  Future<void> delete({required String url}) async {
    final response = await client.delete(Uri.parse(url));
    if (response.statusCode == 200) {
      print('sucesso');
    } else {
      throw Exception('erro ao deletar ${response.statusCode}');
    }
  }

  @override
  Future get({required String url}) async {
    final response = await client.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('erro ao fazer a requisição ${response.statusCode}');
    }
  }

  @override
  Future<void> post({
    required String url,
    Object? body,
    Map<String, String>? headers,
  }) async {
    final response = await client.post(
      Uri.parse(url),
      body: body,
      headers: headers,
    );

    if (response.statusCode == 200) {
      print('sucesso');
    } else {
      throw Exception('erro ao inserir ${response.statusCode}');
    }
  }

  @override
  Future<void> put({
    required String url,
    Object? body,
    Map<String, String>? headers,
  }) async {
    final response = await client.put(
      Uri.parse(url),
      body: body,
      headers: headers,
    );

    if (response.statusCode == 200) {
      print('sucesso');
    } else {
      throw Exception('erro ao inserir ${response.statusCode}');
    }
  }
}
