import '../contracts/device/device.dart';

class BarCodeRead {
  final DeviceCamScanner camScanner;

  BarCodeRead({
    required this.camScanner,
  });

  Future<void> scanCode() async {
    await camScanner.scan();
  }
}
