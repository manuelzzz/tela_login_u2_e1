import 'package:tela_login_u2_e1/src/modules/products/domain/entities/product.dart';
import 'package:tela_login_u2_e1/src/modules/products/infra/datasources/interface_product_datasource.dart';
import 'package:tela_login_u2_e1/src/modules/products/infra/models/product_model.dart';
import 'package:tela_login_u2_e1/src/services/interfaces/interface_http_service.dart';

class ProductDatasourceImpl implements IProductDatasource {
  final IHttpService httpService;

  ProductDatasourceImpl(this.httpService);

  @override
  Future<List<Product>> getProducts({required int page}) async {
    const int limit = 20;
    final int skip = (page - 1) * limit;

    try {
      final result = await httpService.get(
        endpoint: '/products',
        queryParameters: {
          'limit': limit,
          'skip': skip,
        },
      );
      
      final products = result.data['products'] as List<dynamic>;

      return ProductModel.listFromJson(products);
    } catch (e) {
      rethrow;
    }
  }
}