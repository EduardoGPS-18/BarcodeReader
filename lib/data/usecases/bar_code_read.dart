import 'dart:io';

import 'package:barcode_reader/data/contracts/device/device_error.dart';

import '../contracts/device/device.dart';

class BarCodeRead {
  final DeviceCamScanner camScanner;

  BarCodeRead({
    required this.camScanner,
  });

  Future<File> scanCode() async {
    try {
      final file = await camScanner.scan();
      return file;
    } catch (err) {
      throw DeviceError.scanFailure;
    }
  }
}
