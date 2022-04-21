import 'package:barcode_reader/data/contracts/device/device_error.dart';
import 'package:barcode_reader/data/usecases/usecases.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../mock/mock.dart';

void main() {
  late final BarCodeRead sut;
  late final DeviceCamScannerSpy cameraScannerSpy;

  setUp(() {
    cameraScannerSpy = DeviceCamScannerSpy();
    sut = BarCodeRead(camScanner: cameraScannerSpy);
  });

  test('Should call DeviceCamScanner dependency correctly ...', () async {
    sut.scanCode();
    verify(() => cameraScannerSpy.scan()).called(1);
  });

  test('Should throw DeviceError.scanFailure if DeviceCamScanner throws...', () async {
    const error = DeviceError.scanFailure;
    cameraScannerSpy.mockScanCallError(Exception("Any exception"));

    final result = sut.scanCode();
    expect(result, throwsA(error));
  });
}
