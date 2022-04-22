import 'package:barcode_reader/data/local_database/local_database_delete.dart';
import 'package:barcode_reader/data/usecases/code/local_delete_bar_code.dart';
import 'package:barcode_reader/domain/error/domain_error.dart';
import 'package:barcode_reader/domain/usecases/code/delete_code.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class LocalDatabaseDeleteSpy extends Mock implements LocalDatabaseDelete {
  When mockDeleteCall() => when(() => delete(table: any(named: 'table'), where: any(named: 'where')));
  void mockDeleteSuccess() => mockDeleteCall().thenAnswer((_) async => _);
  void mockDeleteError(dynamic err) => mockDeleteCall().thenThrow(err);
}

void main() {
  late final LocalDeleteBarCode sut;
  late final LocalDatabaseDeleteSpy localDatabaseDeleteSpy;

  setUpAll(() {
    localDatabaseDeleteSpy = LocalDatabaseDeleteSpy();
    sut = LocalDeleteBarCode(localDatabaseDelete: localDatabaseDeleteSpy);

    localDatabaseDeleteSpy.mockDeleteSuccess();
  });

  test('Should call LocalDatabaseDelete with correctly...', () async {
    sut.call(param: DeleteBarCodeParams(barCodeId: 0));
    verify(() => localDatabaseDeleteSpy.delete(table: 'codes', where: {'id': 0}));
  });

  test('Should throws if LocalDatabaseDelete throws...', () async {
    localDatabaseDeleteSpy.mockDeleteError(Exception('any_exception'));
    final result = sut.call(param: DeleteBarCodeParams(barCodeId: 0));

    expect(result, throwsA(DomainError.localDatabaseError));
  });
}
