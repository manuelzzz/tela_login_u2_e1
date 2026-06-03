import 'package:flutter_modular/flutter_modular.dart';
import 'package:tela_login_u2_e1/src/core/modules/http_module.dart';
import 'package:tela_login_u2_e1/src/modules/products/domain/repositories/interface_product_repository.dart';
import 'package:tela_login_u2_e1/src/modules/products/domain/usecases/get_products.dart';
import 'package:tela_login_u2_e1/src/modules/products/external/datasource/product_datasource_impl.dart';
import 'package:tela_login_u2_e1/src/modules/products/infra/datasources/interface_product_datasource.dart';
import 'package:tela_login_u2_e1/src/modules/products/infra/repositories/product_repository_impl.dart';
import 'package:tela_login_u2_e1/src/modules/products/presenter/products_view.dart';

class ProductModule extends Module {
  @override
  List<Module> imports = [HttpModule()];

  @override
  void binds(Injector i) {
    i.add<IGetProducts>(GetProductsImpl.new);
    i.add<IProductRepository>(ProductRepositoryImpl.new);
    i.add<IProductDatasource>(ProductDatasourceImpl.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(Modular.initialRoute, child: (_) => ProductsView());
  }
}
