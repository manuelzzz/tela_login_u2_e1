abstract interface class IHttpService {
  Future<dynamic> get({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
  });

  Future<dynamic> put({
    required String endpoint,
    Object? data,
    Map<String, dynamic>? extraHeaders,
    Map<String, dynamic>? queryParameters,
  });

  Future<dynamic> post({
    required String endpoint,
    Object? data,
    Map<String, dynamic>? extraHeaders,
  });

  Future<dynamic> delete({
    required String endpoint,
    Map<String, dynamic>? extraHeaders,
  });
}
