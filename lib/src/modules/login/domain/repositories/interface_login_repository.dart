abstract interface class ILoginRepository {
  Future<String?> login({required String username, required String password});
}
