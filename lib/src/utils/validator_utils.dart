class ValidatorUtils {
  static String? loginValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "O login é obrigatório";
    }

    return null;
  }

  static String? senhaValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "A senha é obrigatória";
    }

    if (value.length < 6) {
      return "A senha deve conter pelo menos 6 caracteres";
    }

    return null;
  }
}
