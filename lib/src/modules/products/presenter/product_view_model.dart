import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tela_login_u2_e1/src/modules/products/domain/entities/product.dart';
import 'package:tela_login_u2_e1/src/modules/products/domain/usecases/get_products.dart';

class ProductViewModel extends ChangeNotifier {
  final _getProducts = Modular.get<IGetProducts>();

  List<Product> _products = [];
  bool _isLoading = false;
  bool _isLoadingMore = false;
  String? _errorMessage;
  
  int _currentPage = 1;
  bool _hasReachedEnd = false;

  List<Product> get products => _products;
  bool get isLoading => _isLoading;
  bool get isLoadingMore => _isLoadingMore;
  String? get errorMessage => _errorMessage;

  Future<void> loadProducts() async {
    _isLoading = true;
    _errorMessage = null;
    _currentPage = 1;
    _hasReachedEnd = false;
    notifyListeners();

    try {
      _products = await _getProducts(page: _currentPage); 
    } catch (e) {
      _errorMessage = 'Nao foi possivel carregar os produtos.';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadMoreProducts() async {
    if (_isLoadingMore || _isLoading || _hasReachedEnd) return;

    _isLoadingMore = true;
    notifyListeners();

    try {
      _currentPage++;
      
      final newProducts = await _getProducts(page: _currentPage);

      if (newProducts.isEmpty) {
        _hasReachedEnd = true;
      } else {
        _products.addAll(newProducts);
      }
    } catch (e) {
      _currentPage--; 
    } finally {
      _isLoadingMore = false;
      notifyListeners();
    }
  }
}