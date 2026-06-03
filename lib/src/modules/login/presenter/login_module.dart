import 'package:flutter_modular/flutter_modular.dart';
import 'package:tela_login_u2_e1/src/core/modules/http_module.dart';
import 'package:tela_login_u2_e1/src/modules/login/domain/repositories/interface_login_repository.dart';
import 'package:tela_login_u2_e1/src/modules/login/domain/usecases/post_login.dart';
import 'package:tela_login_u2_e1/src/modules/login/external/datasources/login_datasource_impl.dart';
import 'package:tela_login_u2_e1/src/modules/login/infra/datasources/interface_auth_datasource.dart';
import 'package:tela_login_u2_e1/src/modules/login/infra/repositories/auth_repository_impl.dart';
import 'package:tela_login_u2_e1/src/modules/login/presenter/login_view.dart';
import 'package:tela_login_u2_e1/src/modules/login/presenter/login_view_model.dart';

class LoginModule extends Module {
  @override
  List<Module> imports = [HttpModule()];

  @override
  void binds(Injector i) {
    i.add<IPostLogin>(PostLoginImpl.new);
    i.add<ILoginRepository>(LoginRepositoryImpl.new);
    i.add<ILoginDatasource>(LoginDatasourceImpl.new);
    i.add<LoginViewModel>(LoginViewModel.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(Modular.initialRoute, child: (_) => LoginView());
  }
}
