import 'package:barcode_reader/main/factories/pages/code/add_barcode/add_barcode_presenter_factory.dart';
import 'package:barcode_reader/ui/code/add_barcode_page/add_barcode_page.dart';
import 'package:flutter/material.dart';

Widget makeAddBarcodePage() {
  return AddBarcodePage(
    presenter: makeAddBarcodePresenter(),
  );
}
