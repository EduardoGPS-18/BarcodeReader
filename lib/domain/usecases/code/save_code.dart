import 'package:barcode_reader/domain/entities/entities.dart';
import 'package:barcode_reader/domain/usecases/core/core.dart';

abstract class SaveCodeUseCase implements UseCase<CodeEntity, Future<void>> {}
