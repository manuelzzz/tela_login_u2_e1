import 'package:flutter_modular/flutter_modular.dart';
import 'package:tela_login_u2_e1/src/services/implementations/http_service_impl.dart';
import 'package:tela_login_u2_e1/src/services/interfaces/interface_http_service.dart';

class HttpModule extends Module {
  @override
  void binds(Injector i) {
    i.addLazySingleton<IHttpService>(HttpServiceImpl.new);
  }
}
