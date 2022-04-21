import 'dart:io';

import 'package:barcode_reader/domain/usecases/core/core.dart';

abstract class ScanCodeUseCase implements UseCase<File, Future<String>> {}
