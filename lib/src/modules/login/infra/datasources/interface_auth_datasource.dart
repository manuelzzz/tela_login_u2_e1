abstract interface class ILoginDatasource {
  Future<String?> login({required String username, required String password});
}
