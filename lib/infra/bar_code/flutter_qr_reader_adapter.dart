import 'package:barcode_reader/data/bar_code/bar_code.dart';
import 'package:flutter_qr_reader/flutter_qr_reader.dart';

class FlutterQRReaderAdapter implements BarCodeScanner {
  @override
  Future<String> scan(String imagePath) async {
    return await FlutterQrReader.imgScan(imagePath);
  }
}
