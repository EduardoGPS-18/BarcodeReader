import 'package:barcode_reader/main/factories/pages/code/read_barcode/read_barcode_presenter_factory.dart';
import 'package:flutter/material.dart';

import '../../../../../ui/code/read_barcode/read_barcode_page.dart';

Widget makeReadBarcodePage() {
  return ReadBarcodePage(
    presenter: makeReadBarcodePresenter(),
  );
}
