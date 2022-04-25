import 'package:barcode_reader/data/local_database/local_database_fetch.dart';
import 'package:mocktail/mocktail.dart';

class LocalDatabaseFetchSpy extends Mock implements LocalDatabaseFetch {
  When mockReadAllCall() => when(() => readAll(any()));
  void mockReadAllSuccess(List<Map<String, dynamic>> data) => mockReadAllCall().thenAnswer((_) async => data);
  void mockReadAllError(dynamic err) => mockReadAllCall().thenThrow(err);
}
