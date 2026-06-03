import 'package:tela_login_u2_e1/src/config/interface_auth_config.dart';

class AuthConfig implements IAuthConfig {
  String? _token;

  @override
  Map<String, dynamic> generateHeaders({Map<String, dynamic>? extraHeaders}) {
    final headers = <String, dynamic>{
      'Content-Type': 'application/json',
      if (_token != null) 'Authorization': 'Bearer $_token',
      ...?extraHeaders,
    };

    return headers;
  }

  @override
  void saveToken(String token) {
    _token = token;
  }

  @override
  bool get isAuthenticated => _token != null;
}
