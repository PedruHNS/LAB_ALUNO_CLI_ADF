import 'dart:convert';

import 'package:http/http.dart';

import 'package:lab_aluno_cli/services/http_client_interface.dart';

class HttpPackege implements IHttpClient {
  final client = Client();

  @override
  Future<void> delete({required String url}) async {
    final response = await client.delete(Uri.parse(url));
    //! tratar erros
    response.body;
  }

  @override
  Future get({required String url}) async {
    final response = await client.get(Uri.parse(url));
    //!tratar erros

    return jsonDecode(response.body);
  }

  @override
  Future<void> post({
    required String url,
    Object? body,
    Map<String, String>? headers,
  }) async {
    await client.post(
      Uri.parse(url),
      body: body,
      headers: headers,
    );
    //!tratar erros
  }

  @override
  Future<void> put({
    required String url,
    Object? body,
    Map<String, String>? headers,
  }) async {
    await client.put(
      Uri.parse(url),
      body: body,
      headers: headers,
    );
    //!tratar erros
  }
}
