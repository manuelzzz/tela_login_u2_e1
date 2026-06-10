import 'package:flutter_modular/flutter_modular.dart';
import 'package:tela_login_u2_e1/src/config/interface_auth_config.dart';
import 'package:tela_login_u2_e1/src/core/modules/core_module.dart';
import 'package:tela_login_u2_e1/src/core/modules/http_module.dart';
import 'package:tela_login_u2_e1/src/modules/cart/presenter/cart_module.dart';
import 'package:tela_login_u2_e1/src/modules/login/presenter/login_module.dart';
import 'package:tela_login_u2_e1/src/modules/products/presenter/product_module.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [CoreModule(), HttpModule(), CartModule()];

  @override
  void binds(Injector i) {}

  @override
  void routes(RouteManager r) {
    r.redirect(
      '/',
      to: Modular.get<IAuthConfig>().isAuthenticated ? '/ecommerce' : '/login',
    );
    r.module('/login', module: LoginModule());
    r.module('/products', module: ProductModule());
    r.module('/cart', module: CartModule());
  }
}
