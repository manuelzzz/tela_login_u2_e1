import 'package:tela_login_u2_e1/src/modules/products/domain/entities/product.dart';
import 'package:tela_login_u2_e1/src/modules/products/domain/repositories/interface_product_repository.dart';
import 'package:tela_login_u2_e1/src/modules/products/infra/datasources/interface_product_datasource.dart';

class ProductRepositoryImpl implements IProductRepository {
  final IProductDatasource datasource;

  ProductRepositoryImpl(this.datasource);

  @override
  Future<List<Product>> getProducts({required int page}) {
    try {
      return datasource.getProducts(page: page);
    } catch (e) {
      rethrow;
    }
  }
}
