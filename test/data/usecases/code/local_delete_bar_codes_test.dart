import 'package:barcode_reader/data/usecases/code/local_delete_bar_code.dart';
import 'package:barcode_reader/domain/error/domain_error.dart';
import 'package:barcode_reader/domain/usecases/code/delete_code.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks/local_database/local_database_delete_spy.dart';

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
