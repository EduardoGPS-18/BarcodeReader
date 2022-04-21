import 'package:barcode_reader/data/contracts/device/device.dart';
import 'package:mocktail/mocktail.dart';

class DeviceCamScannerSpy extends Mock implements DeviceCamScanner {
  DeviceCamScannerSpy() {
    when(() => scan()).thenAnswer((_) async => _);
  }
}
