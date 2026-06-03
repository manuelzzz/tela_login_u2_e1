import 'package:flutter_modular/flutter_modular.dart';
import 'package:tela_login_u2_e1/src/config/auth_config.dart';
import 'package:tela_login_u2_e1/src/config/interface_auth_config.dart';

class CoreModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.addLazySingleton<IAuthConfig>(AuthConfig.new);
  }
}
