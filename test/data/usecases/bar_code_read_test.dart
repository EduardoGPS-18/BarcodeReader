import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

abstract class DeviceCamScanner {
  Future<void> scan();
}

class BarCodeRead {
  final DeviceCamScanner camScanner;

  BarCodeRead({
    required this.camScanner,
  });

  Future<void> scanCode() async {
    await camScanner.scan();
  }
}

class DeviceCamScannerSpy extends Mock implements DeviceCamScanner {
  DeviceCamScannerSpy() {
    when(() => scan()).thenAnswer((_) async => _);
  }
}

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
