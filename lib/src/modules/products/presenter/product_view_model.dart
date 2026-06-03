import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tela_login_u2_e1/src/modules/products/domain/entities/product.dart';
import 'package:tela_login_u2_e1/src/modules/products/domain/usecases/get_products.dart';

class ProductViewModel extends ChangeNotifier {
  final _getProducts = Modular.get<IGetProducts>();

  List<Product> _products = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<Product> get products => _products;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> loadProducts() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _products = await _getProducts();
    } catch (e) {
      _errorMessage = 'Nao foi possivel carregar os produtos.';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
