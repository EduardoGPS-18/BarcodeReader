import 'package:barcode_reader/data/usecases/code/local_delete_bar_code.dart';
import 'package:barcode_reader/domain/usecases/code/delete_code.dart';
import 'package:barcode_reader/main/factories/adapters/local_storage_adapter_factory.dart';

DeleteBarCode makeDeleteBarCode() {
  return LocalDeleteBarCode(
    localDatabaseDelete: makeLocalStorageAdapter(),
  );
}
