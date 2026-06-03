import 'dart:developer';

import 'package:tela_login_u2_e1/src/modules/login/domain/repositories/interface_login_repository.dart';

abstract class IPostLogin {
  Future<String?> call({required String username, required String password});
}

class PostLoginImpl extends IPostLogin {
  final ILoginRepository _repository;

  PostLoginImpl(this._repository);

  @override
  Future<String?> call({
    required String username,
    required String password,
  }) async {
    try {
      return await _repository.login(username: username, password: password);
    } catch (e) {
      log('Erro ao realizar login: $e');
      rethrow;
    }
  }
}
