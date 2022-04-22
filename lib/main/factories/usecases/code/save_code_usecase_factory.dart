import 'package:barcode_reader/data/usecases/code/local_save_bar_code.dart';
import 'package:barcode_reader/domain/usecases/code/save_code.dart';
import 'package:barcode_reader/main/factories/adapters/local_storage_adapter_factory.dart';

SaveCodeUseCase makeSaveCodeUseCase() {
  return LocalSaveBarCode(
    saveLocalStorage: makeLocalStorageAdapter(),
  );
}
