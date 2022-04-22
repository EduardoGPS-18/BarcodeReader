import 'package:barcode_reader/domain/usecases/core/core.dart';

import '../../entities/entities.dart';

abstract class SaveCodeUseCase implements UseCase<SaveCodeParams, Future<CodeEntity>> {}

class SaveCodeParams {
  final String title;
  final String code;
  SaveCodeParams({
    required this.title,
    required this.code,
  });
}
