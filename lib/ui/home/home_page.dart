import 'package:flutter/material.dart';
import 'package:flutter_qr_reader/flutter_qr_reader.dart';
import 'package:permission_handler/permission_handler.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Permission.camera.request(),
      builder: (_, __) => Scaffold(
        body: Center(
          child: QrReaderView(
            width: 250,
            height: 300,
            callback: (controller) {},
          ),
        ),
      ),
    );
  }
}
