import 'package:flutter/material.dart';
import 'package:tela_login_u2_e1/src/pages/login_page.dart';
import 'package:tela_login_u2_e1/src/widgets/produto_widget.dart';

class LojaOnlinePage extends StatelessWidget {
  const LojaOnlinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loja Online'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 0.68, // Ajusta a proporção dos cards para caber o texto
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: const [
            ProdutoWidget(
              nome: 'Notebook',
              descricao: 'Notebook 15" com processador Intel Core i7',
              preco: 3500.00,
            ),
            ProdutoWidget(
              nome: 'Mouse',
              descricao: 'Mouse sem fio com bateria de longa duração',
              preco: 85.00,
            ),
            ProdutoWidget(
              nome: 'Teclado',
              descricao: 'Teclado RGB com switch mecânico',
              preco: 450.00,
            ),
            ProdutoWidget(
              nome: 'Monitor',
              descricao: 'Monitor Full HD com painel IPS',
              preco: 1200.00,
            ),
          ],
        ),
      ),
    );
  }
}