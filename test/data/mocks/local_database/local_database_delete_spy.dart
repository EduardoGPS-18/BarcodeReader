import 'package:barcode_reader/data/local_database/local_database_delete.dart';
import 'package:mocktail/mocktail.dart';

class LocalDatabaseDeleteSpy extends Mock implements LocalDatabaseDelete {
  When mockDeleteCall() => when(() => delete(table: any(named: 'table'), where: any(named: 'where')));
  void mockDeleteSuccess() => mockDeleteCall().thenAnswer((_) async => _);
  void mockDeleteError(dynamic err) => mockDeleteCall().thenThrow(err);
}
