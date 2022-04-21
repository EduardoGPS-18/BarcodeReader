abstract class LocalDatabaseFetch<T> {
  Future<T> readAll(String tableName);
}
