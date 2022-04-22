import 'package:barcode_reader/domain/usecases/core/core.dart';

abstract class DeleteBarCode implements UseCase<DeleteBarCodeParams, Future<void>> {}

class DeleteBarCodeParams {
  final int barCodeId;

  DeleteBarCodeParams({
    required this.barCodeId,
  });
}
