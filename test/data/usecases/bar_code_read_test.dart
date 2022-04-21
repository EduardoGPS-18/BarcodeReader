import 'dart:io';

import 'package:barcode_reader/data/contracts/device/device_error.dart';
import 'package:barcode_reader/data/usecases/usecases.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../mock/mock.dart';

void main() {
  late final BarCodeRead sut;
  late final DeviceCamScannerSpy cameraScannerSpy;

  setUpAll(() {
    cameraScannerSpy = DeviceCamScannerSpy();
    sut = BarCodeRead(camScanner: cameraScannerSpy);
    cameraScannerSpy.mockScanCallSuccess(File('validFile'));
  });

  test('Should call DeviceCamScanner dependency correctly ...', () async {
    await sut.call();
    verify(() => cameraScannerSpy.scan()).called(1);
  });

  test('Should throw DeviceError.scanFailure if DeviceCamScanner throws...', () async {
    cameraScannerSpy.mockScanCallError(Exception("Any exception"));

    final result = sut.call();
    expect(result, throwsA(DeviceError.scanFailure));
  });

  test('Should return File when DeviceCamScanner scan something...', () async {
    final validFile = File('valid_path');
    cameraScannerSpy.mockScanCallSuccess(validFile);

    final file = await sut.call();

    expect(file, validFile);
  });
}
