// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

import 'package:lab_aluno_cli/services/http_client_interface.dart';

class DioPackege implements IHttpClient {
  final client = Dio();

  @override
  Future<void> delete({required String url}) async {
    await client.delete(url);
  }

  @override
  Future get({required String url}) async {
    try {
      final response = await client.get(url);

      if (response.data == null) {
        throw Exception('não encontrado');
      } else {
        return response.data;
      }
    } on DioException {
      throw Exception();
    }
  }

  @override
  Future<void> post({
    required String url,
    Object? body,
    Map<String, String>? headers,
  }) async {
    await client.post(url, data: body);
  }

  @override
  Future<void> put({
    required String url,
    Object? body,
    Map<String, String>? headers,
  }) async {
    await client.put(url, data: body);
  }
}
