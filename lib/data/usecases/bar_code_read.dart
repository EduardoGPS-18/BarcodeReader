import 'package:barcode_reader/data/contracts/device/device_error.dart';

import '../contracts/device/device.dart';

class BarCodeRead {
  final DeviceCamScanner camScanner;

  BarCodeRead({
    required this.camScanner,
  });

  Future<void> scanCode() async {
    try {
      await camScanner.scan();
    } catch (err) {
      throw DeviceError.scanFailure;
    }
  }
}
