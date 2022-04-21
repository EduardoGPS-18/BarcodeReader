import 'dart:io';

import 'package:barcode_reader/data/bar_code/bar_code.dart';
import 'package:barcode_reader/domain/usecases/code/read_code.dart';

class BarCodeRead implements ReadCodeUseCase {
  final BarCodeScanner camScanner;

  BarCodeRead({
    required this.camScanner,
  });

  @override
  Future<String> call({required File param}) async {
    try {
      final data = await camScanner.scan(param.path);
      return data;
    } catch (err) {
      throw BarCodeError.scanError;
    }
  }
}
