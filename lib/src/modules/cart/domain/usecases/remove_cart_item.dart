import 'package:tela_login_u2_e1/src/modules/cart/domain/entities/cart_item.dart';
import 'package:tela_login_u2_e1/src/modules/cart/domain/repositories/interface_cart_repository.dart';

abstract interface class IRemoveCartItem {
  Future<List<CartItem>> call(String productKey);
}

class RemoveCartItemImpl implements IRemoveCartItem {
  final ICartRepository repository;

  RemoveCartItemImpl(this.repository);

  @override
  Future<List<CartItem>> call(String productKey) {
    return repository.removeProduct(productKey);
  }
}
