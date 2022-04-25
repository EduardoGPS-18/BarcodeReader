import 'package:barcode_reader/data/local_database/local_database.dart';
import 'package:mocktail/mocktail.dart';

class LocalDatabaseSaveSpy extends Mock implements LocalDatabaseSave {
  LocalDatabaseSaveSpy() {
    mockSaveSuccess(0);
  }

  When mockSaveCall() => when(() => save(table: any(named: 'table'), values: any(named: 'values')));
  void mockSaveSuccess(int result) => mockSaveCall().thenAnswer((_) async => result);
  void mockSaveError(dynamic err) => mockSaveCall().thenThrow(err);
}
