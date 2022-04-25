import 'package:barcode_reader/data/local_database/local_database.dart';
import 'package:barcode_reader/data/usecases/code/code.dart';
import 'package:barcode_reader/domain/entities/entities.dart';
import 'package:barcode_reader/domain/error/domain_error.dart';
import 'package:barcode_reader/domain/usecases/code/save_code.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class LocalDatabaseSaveSpy extends Mock implements LocalDatabaseSave {
  LocalDatabaseSaveSpy() {
    mockSaveSuccess(0);
  }

  When mockSaveCall() => when(() => save(table: any(named: 'table'), values: any(named: 'values')));
  void mockSaveSuccess(int result) => mockSaveCall().thenAnswer((_) async => result);
  void mockSaveError(dynamic err) => mockSaveCall().thenThrow(err);
}

void main() {
  late final LocalDatabaseSaveSpy localDatabaseSaveSpy;
  late final LocalSaveBarCode sut;
  late final SaveCodeParams mockSaveParams;

  setUpAll(() {
    mockSaveParams = SaveCodeParams(title: 'any_title', code: 'any_code');
    localDatabaseSaveSpy = LocalDatabaseSaveSpy();
    sut = LocalSaveBarCode(saveLocalStorage: localDatabaseSaveSpy);
  });

  test('Should call local database save with correct values ...', () async {
    await sut.call(param: mockSaveParams);

    verify(
      () => localDatabaseSaveSpy.save(table: 'codes', values: {
        'title': mockSaveParams.title,
        'code': mockSaveParams.code,
      }),
    );
  });

  test('Should throws if LocalStorageThrows...', () async {
    localDatabaseSaveSpy.mockSaveError(Exception('any_exception'));
    final result = sut.call(param: SaveCodeParams(title: 'any_title', code: 'any_code'));

    expect(result, throwsA(DomainError.localDatabaseError));
  });

  test('Should returns CodeEntity on succeed ...', () async {
    localDatabaseSaveSpy.mockSaveSuccess(5);

    final result = await sut.call(param: mockSaveParams);

    expect(result, CodeEntity(id: 5, title: mockSaveParams.title, code: mockSaveParams.code));
  });
}
