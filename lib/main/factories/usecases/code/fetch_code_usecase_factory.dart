import 'package:barcode_reader/data/usecases/code/code.dart';
import 'package:barcode_reader/domain/usecases/code/fetch_code.dart';
import 'package:barcode_reader/main/factories/adapters/local_storage_adapter_factory.dart';

FetchBarCodes makeFetchBarCodes() {
  return LocalFetchBarCodes(
    localDatabaseFetch: makeLocalStorageAdapter(),
  );
}
