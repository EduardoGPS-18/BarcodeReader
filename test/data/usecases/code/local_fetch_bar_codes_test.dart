import 'package:barcode_reader/data/usecases/code/local_fetch_bar_codes.dart';
import 'package:barcode_reader/domain/entities/entities.dart';
import 'package:barcode_reader/domain/error/domain_error.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks/local_database/local_database_fetch_spy.dart';

void main() {
  late final LocalFetchBarCodes sut;
  late final LocalDatabaseFetchSpy localDatabaseFetchSpy;

  setUpAll(() {
    localDatabaseFetchSpy = LocalDatabaseFetchSpy();
    sut = LocalFetchBarCodes(localDatabaseFetch: localDatabaseFetchSpy);

    localDatabaseFetchSpy.mockReadAllSuccess([]);
  });

  test('Should call LocalDatabaseFetch with correctly...', () async {
    await sut.call();
    verify(() => localDatabaseFetchSpy.readAll('codes'));
  });

  test('Should throws if LocalDatabaseFetch throws...', () async {
    localDatabaseFetchSpy.mockReadAllError(Exception('any_exception'));

    final result = sut.call();

    expect(result, throwsA(DomainError.localDatabaseError));
  });

  test('Should throws on missing key error...', () async {
    localDatabaseFetchSpy.mockReadAllSuccess([
      {'title': 'any_title', 'INVALIDKEY': 'any_code', 'imagePath': 'invalidPath'}
    ]);
    final result = sut.call();

    expect(result, throwsA(DomainError.invalidData));
  });

  test('Should return a list of CodeEntity on succeed...', () async {
    final storageData = <Map<String, dynamic>>[
      {'title': "any_title", 'code': 'any_code', 'id': 0},
      {'title': "any_title_2", 'code': 'any_code_2', 'id': 5},
    ];
    localDatabaseFetchSpy.mockReadAllSuccess(storageData);
    final result = await sut.call();

    expect(result, [
      const CodeEntity(
        title: 'any_title',
        code: 'any_code',
        id: 0,
      ),
      const CodeEntity(
        title: 'any_title_2',
        code: 'any_code_2',
        id: 5,
      ),
    ]);
  });
}
