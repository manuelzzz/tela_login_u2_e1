import 'dart:developer';

import 'package:tela_login_u2_e1/src/modules/products/domain/entities/product.dart';
import 'package:tela_login_u2_e1/src/modules/products/domain/repositories/interface_product_repository.dart';

abstract interface class IGetProducts {
  Future<List<Product>> call({required int page});
}

class GetProductsImpl implements IGetProducts {
  final IProductRepository repository;

  GetProductsImpl(this.repository);

  @override
  Future<List<Product>> call({required int page}) async {
    try {
      return await repository.getProducts(page: page);
    } catch (e) {
      log('Erro ao recuperar produtos: $e');
      rethrow;
    }
  }
}
