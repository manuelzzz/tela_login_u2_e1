import 'package:tela_login_u2_e1/src/modules/cart/domain/entities/cart_item.dart';
import 'package:tela_login_u2_e1/src/modules/products/domain/entities/product.dart';

abstract interface class ICartRepository {
  Future<List<CartItem>> getItems();
  Future<List<CartItem>> addProduct(Product product);
  Future<List<CartItem>> incrementProduct(String productKey);
  Future<List<CartItem>> decrementProduct(String productKey);
  Future<List<CartItem>> removeProduct(String productKey);
  Future<List<CartItem>> clear();
}
