import 'package:barcode_reader/data/contracts/device/device.dart';
import 'package:mocktail/mocktail.dart';

class DeviceCamScannerSpy extends Mock implements DeviceCamScanner {
  DeviceCamScannerSpy() {
    scanCallMock.thenAnswer((_) async => _);
  }

  When get scanCallMock => when(() => scan());
  void mockScanCallError(err) => scanCallMock.thenThrow(err);
}
