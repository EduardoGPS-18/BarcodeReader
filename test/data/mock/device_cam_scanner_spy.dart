import 'dart:io';

import 'package:barcode_reader/data/contracts/device/device.dart';
import 'package:mocktail/mocktail.dart';

class DeviceCamScannerSpy extends Mock implements DeviceCamScanner {
  DeviceCamScannerSpy();

  When scanCallMock() => when(() => scan());
  void mockScanCallError(err) => scanCallMock().thenThrow(err);
  void mockScanCallSuccess(File file) => scanCallMock().thenAnswer((_) async => file);
}
