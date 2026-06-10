import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tela_login_u2_e1/src/modules/cart/domain/entities/cart_item.dart';
import 'package:tela_login_u2_e1/src/modules/cart/infra/datasources/interface_cart_datasource.dart';
import 'package:tela_login_u2_e1/src/modules/products/infra/models/product_model.dart';

class CartLocalDatasourceImpl implements ICartDatasource {
  static const _cartItemsKey = 'cart_items';

  @override
  Future<List<CartItem>> getItems() async {
    final preferences = await SharedPreferences.getInstance();
    final jsonText = preferences.getString(_cartItemsKey);

    if (jsonText == null || jsonText.isEmpty) {
      return [];
    }

    final jsonList = jsonDecode(jsonText) as List<dynamic>;

    return jsonList.map((json) {
      final item = json as Map<String, dynamic>;
      final productJson = item['product'] as Map<String, dynamic>;
      final quantity = item['quantity'] as int? ?? 1;

      return CartItem(
        product: ProductModel.fromJson(productJson),
        quantity: quantity,
      );
    }).toList();
  }

  @override
  Future<void> saveItems(List<CartItem> items) async {
    final preferences = await SharedPreferences.getInstance();
    final jsonList = items.map((item) {
      final product = item.product;

      return {
        'product': ProductModel(
          id: product.id,
          title: product.title,
          price: product.price,
          description: product.description,
          category: product.category,
          image: product.image,
        ).toJson(),
        'quantity': item.quantity,
      };
    }).toList();

    await preferences.setString(_cartItemsKey, jsonEncode(jsonList));
  }
}
