import 'package:barcode_reader/data/bar_code/bar_code.dart';
import 'package:mocktail/mocktail.dart';

class BarCodeScannerSpy extends Mock implements BarCodeScanner {
  BarCodeScannerSpy();

  When scanCallMock(String path) => when(() => scan(any()));
  void mockScanCallError(dynamic err) => scanCallMock('any_path').thenThrow(err);
  void mockScanCallSuccess(String data) => scanCallMock('any_path').thenAnswer((_) async => data);
}
