import 'package:barcode_reader/ui/home/home_page.dart';
import 'package:flutter/material.dart';

import 'home.dart';

Widget makeHomePage() {
  return HomePage(presenter: makeHomePresenter());
}
