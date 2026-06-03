import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tela_login_u2_e1/src/modules/login/presenter/login_view_model.dart';
import 'package:tela_login_u2_e1/src/utils/validator_utils.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final viewModel = Modular.get<LoginViewModel>();

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
              Text("Login", style: theme.textTheme.headlineLarge),
              const SizedBox(height: 20),
              ListenableBuilder(
                listenable: viewModel,
                builder: (context, child) {
                  return Form(
                    key: viewModel.formKey,
                    child: Column(
                      spacing: 5,
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            label: Text("Login"),
                            errorText: viewModel.errorMessage,
                          ),
                          validator: ValidatorUtils.loginValidator,
                          controller: viewModel.loginController,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            label: Text("Senha"),
                            errorText: viewModel.errorMessage,
                          ),
                          obscureText: true,
                          validator: ValidatorUtils.senhaValidator,
                          controller: viewModel.senhaController,
                        ),
                      ],
                    ),
                  );
                },
              ),
              ElevatedButton(
                onPressed: viewModel.onPressedLogin,
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
