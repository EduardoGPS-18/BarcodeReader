import 'package:barcode_reader/data/local_database/local_database_fetch.dart';
import 'package:barcode_reader/data/usecases/code/local_fetch_bar_codes.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class LocalDatabaseFetchSpy<T> extends Mock implements LocalDatabaseFetch<T> {
  When mockReadAllCall() => when(() => readAll(any()));
  void mockReadAllSuccess(T data) => mockReadAllCall().thenAnswer((_) async => data);
  void mockReadAllError(dynamic err) => mockReadAllCall().thenThrow(err);
}

void main() {
  late final LocalFetchBarCodes sut;
  late final LocalDatabaseFetchSpy<List<Map<String, dynamic>>> localDatabaseFetchSpy;

  setUpAll(() {
    localDatabaseFetchSpy = LocalDatabaseFetchSpy();
    sut = LocalFetchBarCodes(localDatabaseFetch: localDatabaseFetchSpy);

    localDatabaseFetchSpy.mockReadAllSuccess([]);
  });

  test('Should call LocalDatabaseFetch with correctly...', () async {
    await sut.call();
    verify(() => localDatabaseFetchSpy.readAll('codes'));
  });
}
