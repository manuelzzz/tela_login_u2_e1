import 'package:tela_login_u2_e1/src/modules/products/domain/entities/product.dart';

abstract interface class IProductRepository {
  Future<List<Product>> getProducts();
}
