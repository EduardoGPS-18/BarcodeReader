abstract class LocalDatabaseSave {
  Future<int> save({required String table, required Map<String, dynamic> values});
}
