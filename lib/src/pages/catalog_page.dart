import 'package:flutter/material.dart';
import 'package:tela_login_u2_e1/src/widgets/product_card.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

  static const _imageUrl =
      "https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=600";

  static const List<Map<String, String>> _products = [
    {
      "name": "Tênis Esportivo",
      "description": "Confortável para corridas e caminhadas diárias.",
      "price": "R\$ 199,90",
    },
    {
      "name": "Mochila Urbana",
      "description": "Compacta, resistente e ideal para rotina.",
      "price": "R\$ 149,90",
    },
    {
      "name": "Fone Bluetooth",
      "description": "Som nítido e bateria de longa duração.",
      "price": "R\$ 89,90",
    },
    {
      "name": "Relógio Casual",
      "description": "Design moderno para uso no dia a dia.",
      "price": "R\$ 129,90",
    },
    {
      "name": "Tênis Esportivo",
      "description": "Confortável para corridas e caminhadas diárias.",
      "price": "R\$ 199,90",
    },
    {
      "name": "Mochila Urbana",
      "description": "Compacta, resistente e ideal para rotina.",
      "price": "R\$ 149,90",
    },
    {
      "name": "Fone Bluetooth",
      "description": "Som nítido e bateria de longa duração.",
      "price": "R\$ 89,90",
    },
    {
      "name": "Relógio Casual",
      "description": "Design moderno para uso no dia a dia.",
      "price": "R\$ 129,90",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Catálogo da Loja")),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
          itemCount: _products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.6,
          ),
          itemBuilder: (context, index) {
            final product = _products[index];
            return ProductCard(
              imageUrl: _imageUrl,
              name: product["name"]!,
              description: product["description"]!,
              price: product["price"]!,
              onBuy: () {},
            );
          },
        ),
      ),
    );
  }
}
