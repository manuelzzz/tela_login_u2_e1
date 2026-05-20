import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tela_login_u2_e1/src/utils/validator_utils.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final loginController = TextEditingController();
  final senhaController = TextEditingController();

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
                      validator: ValidatorUtils.loginValidator,
                      controller: loginController,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Senha"),
                      ),
                      obscureText: true,
                      validator: ValidatorUtils.senhaValidator,
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
