import 'package:barcode_reader/data/contracts/device/device.dart';
import 'package:barcode_reader/data/usecases/usecases.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../mock/mock.dart';

void main() {
  late final BarCodeRead sut;
  late final DeviceCamScanner cameraScannerSpy;

  setUp(() {
    cameraScannerSpy = DeviceCamScannerSpy();
    sut = BarCodeRead(camScanner: cameraScannerSpy);
  });

  test('Should call DeviceCamScanner dependency correctly ...', () async {
    sut.scanCode();
    verify(() => cameraScannerSpy.scan()).called(1);
  });
}
