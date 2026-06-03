abstract class IAuthConfig {
  bool get isAuthenticated;

  Map<String, dynamic> generateHeaders({Map<String, dynamic>? extraHeaders});

  void saveToken(String token);
}
