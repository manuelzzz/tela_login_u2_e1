import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tela_login_u2_e1/src/app.dart';
import 'package:tela_login_u2_e1/src/app_module.dart';

void main() {
  runApp(ModularApp(module: AppModule(), child: const App()));
}
