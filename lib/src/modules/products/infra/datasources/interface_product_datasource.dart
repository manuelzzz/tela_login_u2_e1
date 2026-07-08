import 'package:tela_login_u2_e1/src/modules/products/domain/entities/product.dart';

abstract interface class IProductDatasource {
  Future<List<Product>> getProducts({required int page});
}
