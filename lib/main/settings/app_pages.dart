import 'package:barcode_reader/main/factories/pages/code/add_barcode/add_barcode_page_factory.dart';
import 'package:barcode_reader/main/factories/pages/code/read_barcode/read_barcode_page_factory.dart';
import 'package:barcode_reader/main/factories/pages/home/home_page_factory.dart';
import 'package:barcode_reader/main/settings/app_routes.dart';
import 'package:flutter/material.dart';

class AppPages {
  static Map<String, Widget Function(BuildContext)> get pages => {
        AppRoutes.homePage: (ctx) => makeHomePage(),
        AppRoutes.addBarCodePage: (ctx) => makeAddBarcodePage(),
        AppRoutes.barCodeCamPage: (ctx) => makeReadBarcodePage(),
      };
}
