import 'dart:io';

import 'package:barcode_reader/data/bar_code/bar_code.dart';
import 'package:barcode_reader/domain/error/domain_error.dart';
import 'package:barcode_reader/domain/usecases/code/scan_code.dart';

class BarCodeScan implements ScanCodeUseCase {
  final BarCodeScanner camScanner;

  BarCodeScan({
    required this.camScanner,
  });

  @override
  Future<String> call({required File param}) async {
    try {
      final data = await camScanner.scan(param.path);
      return data;
    } catch (err) {
      throw DomainError.codeScanError;
    }
  }
}
