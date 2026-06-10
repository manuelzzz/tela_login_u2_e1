import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tela_login_u2_e1/src/modules/cart/domain/entities/cart_item.dart';
import 'package:tela_login_u2_e1/src/modules/cart/domain/usecases/add_product_to_cart.dart';
import 'package:tela_login_u2_e1/src/modules/cart/domain/usecases/clear_cart.dart';
import 'package:tela_login_u2_e1/src/modules/cart/domain/usecases/decrement_cart_item.dart';
import 'package:tela_login_u2_e1/src/modules/cart/domain/usecases/get_cart_items.dart';
import 'package:tela_login_u2_e1/src/modules/cart/domain/usecases/increment_cart_item.dart';
import 'package:tela_login_u2_e1/src/modules/cart/domain/usecases/remove_cart_item.dart';
import 'package:tela_login_u2_e1/src/modules/products/domain/entities/product.dart';

class CartViewModel extends ChangeNotifier {
  final _getCartItems = Modular.get<IGetCartItems>();
  final _addProductToCart = Modular.get<IAddProductToCart>();
  final _incrementCartItem = Modular.get<IIncrementCartItem>();
  final _decrementCartItem = Modular.get<IDecrementCartItem>();
  final _removeCartItem = Modular.get<IRemoveCartItem>();
  final _clearCart = Modular.get<IClearCart>();

  List<CartItem> _items = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<CartItem> get items => _items;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  int get totalItems {
    return _items.fold(0, (total, item) => total + item.quantity);
  }

  double get totalPrice {
    return _items.fold(0.0, (total, item) => total + item.subtotal);
  }

  Future<void> loadCart() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _items = await _getCartItems();
    } catch (_) {
      _errorMessage = 'Nao foi possivel carregar o carrinho.';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addProduct(Product product) async {
    try {
      _items = await _addProductToCart(product);
      _errorMessage = null;
      notifyListeners();
    } catch (_) {
      _errorMessage = 'Nao foi possivel adicionar o produto.';
      notifyListeners();
    }
  }

  Future<void> incrementItem(String productKey) async {
    _items = await _incrementCartItem(productKey);
    notifyListeners();
  }

  Future<void> decrementItem(String productKey) async {
    _items = await _decrementCartItem(productKey);
    notifyListeners();
  }

  Future<void> removeItem(String productKey) async {
    _items = await _removeCartItem(productKey);
    notifyListeners();
  }

  Future<void> clearCart() async {
    _items = await _clearCart();
    notifyListeners();
  }
}
