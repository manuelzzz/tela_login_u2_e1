import 'package:flutter/material.dart';

class TelaLogin extends StatefulWidget {
  const TelaLogin({super.key});

  @override
  State<TelaLogin> createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  String login = '';
  String senha = '';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 5,
            children: [
              Text("Minha aplicação", style: theme.textTheme.headlineLarge),
              const SizedBox(height: 20),

              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Login"),
                ),
                onChanged: (valor) {
                  setState(() {
                    login = valor;
                  });
                },
              ),

              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Senha"),
                ),
                obscureText: true,
                onChanged: (valor) {
                  setState(() {
                    senha = valor;
                  });
                },
              ),

              ElevatedButton(
                onPressed: () {
                  print("Login: $login");
                  print("Senha: $senha");
                },
                style: const ButtonStyle(
                  minimumSize: WidgetStatePropertyAll(
                    Size(double.infinity, 40),
                  ),
                ),
                child: Text("Login"),
              ),
              TextButton(onPressed: () {}, child: Text("Esqueceu a senha?")),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Não tem uma conta?"),
                  TextButton(onPressed: () {}, child: Text("Cadastre-se")),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}