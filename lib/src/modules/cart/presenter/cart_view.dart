import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tela_login_u2_e1/src/modules/cart/presenter/cart_view_model.dart';
import 'package:tela_login_u2_e1/src/modules/cart/presenter/widgets/cart_item_widget.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  final CartViewModel _viewModel = Modular.get<CartViewModel>();

  @override
  void initState() {
    super.initState();
    _viewModel.loadCart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF7C00FF),
        foregroundColor: Colors.white,
        title: const Text(
          'Meu Carrinho',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListenableBuilder(
        listenable: _viewModel,
        builder: (context, _) {
          if (_viewModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return Column(
            children: [
              Expanded(child: _buildContent()),
              _CartFooter(totalPrice: _viewModel.totalPrice, onConfirm: () {}),
            ],
          );
        },
      ),
    );
  }

  Widget _buildContent() {
    if (_viewModel.errorMessage != null) {
      return Center(child: Text(_viewModel.errorMessage!));
    }

    if (_viewModel.items.isEmpty) {
      return const Center(child: Text('Carrinho vazio'));
    }

    return ListView.builder(
      padding: const EdgeInsets.only(top: 16, bottom: 16),
      itemCount: _viewModel.items.length,
      itemBuilder: (context, index) {
        final item = _viewModel.items[index];

        return CartItemWidget(
          item: item,
          onIncrement: () => _viewModel.incrementItem(item.productKey),
          onDecrement: () => _viewModel.decrementItem(item.productKey),
          onRemove: () => _viewModel.removeItem(item.productKey),
        );
      },
    );
  }
}

class _CartFooter extends StatelessWidget {
  final double totalPrice;
  final VoidCallback onConfirm;

  const _CartFooter({required this.totalPrice, required this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Color(0xFFE0E0E0))),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Total:', style: TextStyle(fontSize: 18)),
                Text(
                  'R\$ ${totalPrice.toStringAsFixed(2)}',
                  style: const TextStyle(
                    color: Color(0xFF6A00FF),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: onConfirm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF7C00FF),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Confirmar Compra',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
