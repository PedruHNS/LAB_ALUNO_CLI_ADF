abstract interface class IHttpClient {
  Future<dynamic> get({required String url});
  Future<void> post({
    required String url,
    Object? body,
    Map<String, String>? headers,
  });
  Future<void> put({
    required String url,
    Object? body,
    Map<String, String>? headers,
  });

  Future<void> delete({required String url});
}
