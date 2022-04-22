import 'package:barcode_reader/data/local_database/local_database_save.dart';
import 'package:barcode_reader/domain/entities/entities.dart';
import 'package:barcode_reader/domain/error/domain_error.dart';
import 'package:barcode_reader/domain/usecases/code/save_code.dart';

class LocalSaveBarCode implements SaveCodeUseCase {
  LocalDatabaseSave saveLocalStorage;

  LocalSaveBarCode({
    required this.saveLocalStorage,
  });

  @override
  Future<CodeEntity> call({required SaveCodeParams param}) async {
    try {
      final id = await saveLocalStorage.save(table: 'codes', values: param.toLocalMap);
      return CodeEntity(id: id, title: param.title, code: param.code);
    } catch (err) {
      throw DomainError.localDatabaseError;
    }
  }
}

extension on SaveCodeParams {
  Map<String, dynamic> get toLocalMap {
    return {
      'title': title,
      'code': code,
    };
  }
}
