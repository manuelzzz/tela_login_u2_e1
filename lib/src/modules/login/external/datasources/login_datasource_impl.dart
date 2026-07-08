import 'package:tela_login_u2_e1/src/modules/login/infra/datasources/interface_auth_datasource.dart';
import 'package:tela_login_u2_e1/src/services/interfaces/interface_http_service.dart';

class LoginDatasourceImpl implements ILoginDatasource {
  final IHttpService _httpService;

  LoginDatasourceImpl(this._httpService);

  @override
  Future<String?> login({
    required String username,
    required String password,
  }) async {
    try {
      final response = await _httpService.post(
        endpoint: '/auth/login',
        data: {'username': username, 'password': password},
      );

      return response.data['accessToken'] ?? response.data['token'];
    } catch (e) {
      rethrow;
    }
  }
}
