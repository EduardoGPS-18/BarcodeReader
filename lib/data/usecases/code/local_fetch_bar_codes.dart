import 'package:barcode_reader/data/local_database/local_database_fetch.dart';

class LocalFetchBarCodes {
  LocalDatabaseFetch<List<Map<String, dynamic>>> localDatabaseFetch;

  LocalFetchBarCodes({
    required this.localDatabaseFetch,
  });

  @override
  Future<void> call() async {
    await localDatabaseFetch.readAll('codes');
  }
}
