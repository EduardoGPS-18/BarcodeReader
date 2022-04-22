import 'package:barcode_reader/data/local_database/local_database_delete.dart';
import 'package:barcode_reader/domain/error/domain_error.dart';
import 'package:barcode_reader/domain/usecases/code/delete_code.dart';

class LocalDeleteBarCode implements DeleteBarCode {
  LocalDatabaseDelete localDatabaseDelete;

  LocalDeleteBarCode({
    required this.localDatabaseDelete,
  });

  @override
  Future<void> call({required DeleteBarCodeParams param}) async {
    try {
      await localDatabaseDelete.delete(table: 'codes', where: {'id': param.barCodeId});
    } catch (err) {
      throw DomainError.localDatabaseError;
    }
  }
}
