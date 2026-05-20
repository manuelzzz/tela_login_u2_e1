import 'dart:developer';

import 'package:flutter/material.dart';

class TelaLogin extends StatefulWidget {
  const TelaLogin({super.key});

  @override
  State<TelaLogin> createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  final formKey = GlobalKey<FormState>();
  final loginController = TextEditingController();
  final senhaController = TextEditingController();

  String? validateLogin(String? value) {
    if (value == null || value.isEmpty) {
      return "O login é obrigatório";
    }

    return null;
  }

  String? validateSenha(String? value) {
    if (value == null || value.isEmpty) {
      return "A senha é obrigatória";
    }

    if (value.length < 6) {
      return "A senha deve conter pelo menos 6 caracteres";
    }

    return null;
  }

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
              Form(
                key: formKey,
                child: Column(
                  spacing: 5,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Login"),
                      ),
                      validator: validateLogin,
                      controller: loginController,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Senha"),
                      ),
                      obscureText: true,
                      validator: validateSenha,
                      controller: senhaController,
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  formKey.currentState?.validate();
                  log("Login: ${loginController.text}");
                  log("Senha: ${senhaController.text}");
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
