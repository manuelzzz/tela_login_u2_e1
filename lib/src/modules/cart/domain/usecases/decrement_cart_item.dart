import 'package:tela_login_u2_e1/src/modules/cart/domain/entities/cart_item.dart';
import 'package:tela_login_u2_e1/src/modules/cart/domain/repositories/interface_cart_repository.dart';

abstract interface class IDecrementCartItem {
  Future<List<CartItem>> call(String productKey);
}

class DecrementCartItemImpl implements IDecrementCartItem {
  final ICartRepository repository;

  DecrementCartItemImpl(this.repository);

  @override
  Future<List<CartItem>> call(String productKey) {
    return repository.decrementProduct(productKey);
  }
}
