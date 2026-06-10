import 'package:tela_login_u2_e1/src/modules/cart/domain/entities/cart_item.dart';
import 'package:tela_login_u2_e1/src/modules/cart/domain/repositories/interface_cart_repository.dart';

abstract interface class IClearCart {
  Future<List<CartItem>> call();
}

class ClearCartImpl implements IClearCart {
  final ICartRepository repository;

  ClearCartImpl(this.repository);

  @override
  Future<List<CartItem>> call() {
    return repository.clear();
  }
}
