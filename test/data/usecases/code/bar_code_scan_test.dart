import 'dart:io';

import 'package:barcode_reader/data/bar_code/bar_code.dart';
import 'package:barcode_reader/data/usecases/usecases.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../mock/mock.dart';

void main() {
  late final BarCodeScan sut;
  late final BarCodeScannerSpy cameraScannerSpy;

  setUpAll(() {
    cameraScannerSpy = BarCodeScannerSpy();
    sut = BarCodeScan(camScanner: cameraScannerSpy);
    cameraScannerSpy.mockScanCallSuccess('any_data');
  });

  test('Should call DeviceCamScanner dependency with correct values ...', () async {
    await sut.call(param: File('any_path'));
    verify(() => cameraScannerSpy.scan('any_path')).called(1);
  });

  test('Should throw DeviceError.scanFailure if DeviceCamScanner throws...', () async {
    cameraScannerSpy.mockScanCallError(Exception("Any exception"));

    final result = sut.call(param: File('any_path'));
    expect(result, throwsA(BarCodeError.scanError));
  });

  test('Should return valid data when DeviceCamScanner scan something...', () async {
    const validData = "valid_data";
    cameraScannerSpy.mockScanCallSuccess(validData);

    final file = await sut.call(param: File('any_path'));

    expect(file, validData);
  });
}
