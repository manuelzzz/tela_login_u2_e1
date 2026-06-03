import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tela_login_u2_e1/src/config/interface_auth_config.dart';
import 'package:tela_login_u2_e1/src/modules/login/domain/usecases/post_login.dart';

class LoginViewModel extends ChangeNotifier {
  final postLogin = Modular.get<IPostLogin>();

  final _formKey = GlobalKey<FormState>();
  final _loginController = TextEditingController();
  final _senhaController = TextEditingController();
  String? _errorMessage;

  GlobalKey<FormState> get formKey => _formKey;
  TextEditingController get loginController => _loginController;
  TextEditingController get senhaController => _senhaController;
  String? get errorMessage => _errorMessage;

  Future<void> onPressedLogin() async {
    try {
      if (_formKey.currentState?.validate() == false) {
        return;
      }
      final login = _loginController.text;
      final senha = _senhaController.text;
      final result = await postLogin(username: login, password: senha);

      if (result == null || result.isEmpty) {
        _errorMessage = 'Login ou senha inválidos';
        notifyListeners();
        return;
      }

      _errorMessage = null;
      Modular.get<IAuthConfig>().saveToken(result);
      notifyListeners();

      Modular.to.pushReplacementNamed('/products');
    } catch (_) {
      notifyListeners();
    }
  }
}
