import 'dart:io';

import 'package:barcode_reader/data/contracts/device/device_error.dart';
import 'package:barcode_reader/domain/usecases/code/read_code.dart';

import '../contracts/device/device.dart';

class BarCodeRead implements ReadCodeUseCase {
  final DeviceCamScanner camScanner;

  BarCodeRead({
    required this.camScanner,
  });

  @override
  Future<File> call() async {
    try {
      final file = await camScanner.scan();
      return file;
    } catch (err) {
      throw DeviceError.scanFailure;
    }
  }
}
