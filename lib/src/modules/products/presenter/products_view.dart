import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tela_login_u2_e1/src/modules/cart/presenter/cart_view_model.dart';
import 'package:tela_login_u2_e1/src/modules/products/presenter/product_view_model.dart';
import 'package:tela_login_u2_e1/src/modules/products/presenter/widgets/product_widget.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({super.key});

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  final ProductViewModel _viewModel = ProductViewModel();
  final CartViewModel _cartViewModel = Modular.get<CartViewModel>();
  
  // 1. Criamos o controlador de rolagem
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _viewModel.loadProducts();
    _cartViewModel.loadCart();

    // 2. Adicionamos o listener para detectar o final da rolagem
    _scrollController.addListener(() {
      // Usamos uma margem de segurança (ex: 100 pixels antes do fim) 
      // para carregar antes de o usuário ver a tela travar
      if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 100) {
        _viewModel.loadMoreProducts(); // Chama a função que criaremos no ViewModel
      }
    });
  }

  @override
  void dispose() {
    // 3. Limpamos o controlador
    _scrollController.dispose();
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loja Online'),
        actions: [
          ListenableBuilder(
            listenable: _cartViewModel,
            builder: (context, _) {
              return _CartIconButton(
                itemCount: _cartViewModel.totalItems,
                onPressed: () async {
                  await Modular.to.pushNamed('/cart');
                  await _cartViewModel.loadCart();
                },
              );
            },
          ),
        ],
      ),
      body: ListenableBuilder(
        listenable: _viewModel,
        builder: (context, _) {
          // Loading da PRIMEIRA página
          if (_viewModel.isLoading && _viewModel.products.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          if (_viewModel.errorMessage != null && _viewModel.products.isEmpty) {
            return Center(child: Text(_viewModel.errorMessage!));
          }

          if (_viewModel.products.isEmpty) {
            return const Center(child: Text('Nenhum produto encontrado'));
          }

          // 4. Envolvemos o GridView em uma Column para o Loading de paginação
          return Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GridView.builder(
                    controller: _scrollController, // 5. Anexamos o controlador aqui!
                    itemCount: _viewModel.products.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.62,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      final product = _viewModel.products[index];

                      return ProductWidget(
                        product: product,
                        onBuy: () => _cartViewModel.addProduct(product),
                      );
                    },
                  ),
                ),
              ),
              // 6. Indicador de carregamento no rodapé (para a paginação)
              if (_viewModel.isLoadingMore)
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: CircularProgressIndicator(),
                ),
            ],
          );
        },
      ),
    );
  }
}

class _CartIconButton extends StatelessWidget {
  final int itemCount;
  final VoidCallback onPressed;

  const _CartIconButton({required this.itemCount, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: onPressed,
          tooltip: 'Carrinho',
        ),
        if (itemCount > 0)
          Positioned(
            top: 6,
            right: 6,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              constraints: const BoxConstraints(minWidth: 18, minHeight: 18),
              child: Text(
                itemCount > 99 ? '99+' : itemCount.toString(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
      ],
    );
  }
}