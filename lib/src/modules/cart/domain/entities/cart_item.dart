import 'package:tela_login_u2_e1/src/modules/products/domain/entities/product.dart';

class CartItem {
  final Product product;
  final int quantity;

  CartItem({required this.product, required this.quantity});

  String get productKey {
    return product.id?.toString() ?? product.title ?? product.image ?? '';
  }

  double get subtotal {
    return (product.price ?? 0.0) * quantity;
  }

  CartItem copyWith({Product? product, int? quantity}) {
    return CartItem(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
    );
  }
}
