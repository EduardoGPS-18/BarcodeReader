import 'package:barcode_reader/data/local_database/local_database_fetch.dart';
import 'package:barcode_reader/data/models/code/code_model.dart';
import 'package:barcode_reader/domain/entities/entities.dart';
import 'package:barcode_reader/domain/error/domain_error.dart';
import 'package:barcode_reader/domain/usecases/code/fetch_code.dart';

import '../../models/error/error.dart';

class LocalFetchBarCodes implements FetchBarCode {
  LocalDatabaseFetch<List<Map<String, dynamic>>> localDatabaseFetch;

  LocalFetchBarCodes({
    required this.localDatabaseFetch,
  });

  @override
  Future<List<CodeEntity>> call() async {
    try {
      final response = await localDatabaseFetch.readAll('codes');
      return response.map((e) => CodeModel.fromLocalMap(e)).toList();
    } on ModelError {
      throw DomainError.invalidData;
    } catch (err) {
      throw DomainError.localDatabaseError;
    }
  }
}
