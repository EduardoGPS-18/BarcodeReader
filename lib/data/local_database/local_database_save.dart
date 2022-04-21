abstract class LocalDatabaseSave {
  Future<void> save({required String table, required Map<String, dynamic> values});
}
