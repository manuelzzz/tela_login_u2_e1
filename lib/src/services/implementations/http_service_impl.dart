import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tela_login_u2_e1/src/config/interface_auth_config.dart';
import 'package:tela_login_u2_e1/src/services/interfaces/interface_http_service.dart';

class HttpServiceImpl implements IHttpService {
  final _baseUrl = 'https://dummyjson.com';
  final _auth = Modular.get<IAuthConfig>;
  final _dio = Dio();

  @override
  Future<dynamic> get({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      return await _dio.get(
        "$_baseUrl$endpoint",
        options: Options(headers: _auth().generateHeaders()),
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<dynamic> delete({
    required String endpoint,
    Map<String, dynamic>? extraHeaders,
  }) async {
    try {
      return await _dio.delete(
        "$_baseUrl$endpoint",
        options: Options(
          headers: _auth().generateHeaders(extraHeaders: extraHeaders),
        ),
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<dynamic> post({
    required String endpoint,
    Object? data,
    Map<String, dynamic>? extraHeaders,
  }) async {
    try {
      return await _dio.post(
        "$_baseUrl$endpoint",
        data: data,
        options: Options(
          headers: _auth().generateHeaders(extraHeaders: extraHeaders),
        ),
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<dynamic> put({
    required String endpoint,
    Object? data,
    Map<String, dynamic>? extraHeaders,
    Map<String, dynamic>? queryParameters,
  }) {
    try {
      return _dio.put(
        "$_baseUrl$endpoint",
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: _auth().generateHeaders(extraHeaders: extraHeaders),
        ),
      );
    } catch (e) {
      rethrow;
    }
  }
}
