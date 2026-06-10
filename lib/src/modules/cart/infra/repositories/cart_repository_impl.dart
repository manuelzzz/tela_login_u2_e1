import 'package:tela_login_u2_e1/src/modules/cart/domain/entities/cart_item.dart';
import 'package:tela_login_u2_e1/src/modules/cart/domain/repositories/interface_cart_repository.dart';
import 'package:tela_login_u2_e1/src/modules/cart/infra/datasources/interface_cart_datasource.dart';
import 'package:tela_login_u2_e1/src/modules/products/domain/entities/product.dart';

class CartRepositoryImpl implements ICartRepository {
  final ICartDatasource datasource;

  CartRepositoryImpl(this.datasource);

  @override
  Future<List<CartItem>> getItems() {
    return datasource.getItems();
  }

  @override
  Future<List<CartItem>> addProduct(Product product) async {
    final items = await datasource.getItems();
    final productKey = _productKey(product);
    final index = items.indexWhere((item) => item.productKey == productKey);

    if (index >= 0) {
      items[index] = items[index].copyWith(quantity: items[index].quantity + 1);
    } else {
      items.add(CartItem(product: product, quantity: 1));
    }

    await datasource.saveItems(items);
    return items;
  }

  @override
  Future<List<CartItem>> incrementProduct(String productKey) async {
    final items = await datasource.getItems();
    final index = items.indexWhere((item) => item.productKey == productKey);

    if (index >= 0) {
      items[index] = items[index].copyWith(quantity: items[index].quantity + 1);
      await datasource.saveItems(items);
    }

    return items;
  }

  @override
  Future<List<CartItem>> decrementProduct(String productKey) async {
    final items = await datasource.getItems();
    final index = items.indexWhere((item) => item.productKey == productKey);

    if (index >= 0 && items[index].quantity > 1) {
      items[index] = items[index].copyWith(quantity: items[index].quantity - 1);
      await datasource.saveItems(items);
    }

    return items;
  }

  @override
  Future<List<CartItem>> removeProduct(String productKey) async {
    final items = await datasource.getItems();
    items.removeWhere((item) => item.productKey == productKey);

    await datasource.saveItems(items);
    return items;
  }

  @override
  Future<List<CartItem>> clear() async {
    await datasource.saveItems([]);
    return [];
  }

  String _productKey(Product product) {
    return product.id?.toString() ?? product.title ?? product.image ?? '';
  }
}
