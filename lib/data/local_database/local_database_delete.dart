abstract class LocalDatabaseDelete {
  Future<void> delete({required String table, required Map<String, dynamic> where});
}
