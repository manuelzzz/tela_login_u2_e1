import 'package:tela_login_u2_e1/src/modules/cart/domain/entities/cart_item.dart';

abstract interface class ICartDatasource {
  Future<List<CartItem>> getItems();
  Future<void> saveItems(List<CartItem> items);
}
