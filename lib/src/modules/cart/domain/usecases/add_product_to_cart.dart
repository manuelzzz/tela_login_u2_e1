import 'package:tela_login_u2_e1/src/modules/cart/domain/entities/cart_item.dart';
import 'package:tela_login_u2_e1/src/modules/cart/domain/repositories/interface_cart_repository.dart';
import 'package:tela_login_u2_e1/src/modules/products/domain/entities/product.dart';

abstract interface class IAddProductToCart {
  Future<List<CartItem>> call(Product product);
}

class AddProductToCartImpl implements IAddProductToCart {
  final ICartRepository repository;

  AddProductToCartImpl(this.repository);

  @override
  Future<List<CartItem>> call(Product product) {
    return repository.addProduct(product);
  }
}
