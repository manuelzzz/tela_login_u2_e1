import 'package:tela_login_u2_e1/src/modules/login/domain/repositories/interface_login_repository.dart';
import 'package:tela_login_u2_e1/src/modules/login/infra/datasources/interface_auth_datasource.dart';

class LoginRepositoryImpl implements ILoginRepository {
  final ILoginDatasource _datasource;

  LoginRepositoryImpl(this._datasource);

  @override
  Future<String?> login({required String username, required String password}) {
    try {
      return _datasource.login(username: username, password: password);
    } catch (e) {
      rethrow;
    }
  }
}
