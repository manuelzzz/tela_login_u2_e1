import 'package:tela_login_u2_e1/src/modules/products/domain/entities/product.dart';
import 'package:tela_login_u2_e1/src/modules/products/infra/datasources/interface_product_datasource.dart';
import 'package:tela_login_u2_e1/src/modules/products/infra/models/product_model.dart';
import 'package:tela_login_u2_e1/src/services/interfaces/interface_http_service.dart';

class ProductDatasourceImpl implements IProductDatasource {
  final IHttpService httpService;

  ProductDatasourceImpl(this.httpService);

  @override
  Future<List<Product>> getProducts() async {
    try {
      final result = await httpService.get(endpoint: '/products');
      final products = result.data['products'] as List<dynamic>;

      return ProductModel.listFromJson(products);
    } catch (e) {
      rethrow;
    }
  }
}
