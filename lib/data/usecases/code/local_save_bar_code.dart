import 'package:barcode_reader/data/local_database/local_database_save.dart';
import 'package:barcode_reader/data/models/code/code_model.dart';
import 'package:barcode_reader/domain/entities/code/code_entity.dart';
import 'package:barcode_reader/domain/usecases/code/save_code.dart';

class LocalSaveBarCode implements SaveCodeUseCase {
  LocalDatabaseSave saveLocalStorage;

  LocalSaveBarCode({
    required this.saveLocalStorage,
  });

  @override
  Future<void> call({required CodeEntity param}) async {
    await saveLocalStorage.save(table: 'codes', values: param.toLocalMap);
  }
}
