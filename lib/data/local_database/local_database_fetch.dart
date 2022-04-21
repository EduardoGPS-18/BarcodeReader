abstract class LocalDatabaseFetch {
  Future<List<Map<String, dynamic>>> readAll(String tableName);
}
