import 'package:barcode_reader/data/local_database/local_database.dart';
import 'package:barcode_reader/data/usecases/code/code.dart';
import 'package:barcode_reader/domain/entities/entities.dart';
import 'package:barcode_reader/domain/error/domain_error.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class LocalDatabaseSaveSpy extends Mock implements LocalDatabaseSave {
  LocalDatabaseSaveSpy() {
    mockSaveSuccess();
  }

  When mockSaveCall() => when(() => save(table: any(named: 'table'), values: any(named: 'values')));
  void mockSaveSuccess() => mockSaveCall().thenAnswer((_) async => _);
  void mockSaveError(dynamic err) => mockSaveCall().thenThrow(err);
}

void main() {
  late final LocalDatabaseSaveSpy localDatabaseSaveSpy;
  late final LocalSaveBarCode sut;
  late final CodeEntity mockCodeEntity;

  setUpAll(() {
    mockCodeEntity = const CodeEntity(
      title: 'any_title',
      code: 'any_code',
      codeImagePath: 'any_path',
    );
    localDatabaseSaveSpy = LocalDatabaseSaveSpy();
    sut = LocalSaveBarCode(saveLocalStorage: localDatabaseSaveSpy);
  });

  test('Should call local database save with correct values ...', () async {
    await sut.call(param: mockCodeEntity);

    verify(
      () => localDatabaseSaveSpy.save(table: 'codes', values: {
        'title': mockCodeEntity.title,
        'code': mockCodeEntity.code,
        'imagePath': mockCodeEntity.codeImagePath,
      }),
    );
  });

  test('Should throws if LocalStorageThrows...', () async {
    localDatabaseSaveSpy.mockSaveError(Exception('any_exception'));
    final result = sut.call(param: mockCodeEntity);

    expect(result, throwsA(DomainError.localDatabaseError));
  });
}
