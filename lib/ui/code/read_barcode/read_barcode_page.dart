import 'package:flutter/material.dart';
import 'package:flutter_qr_reader/flutter_qr_reader.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../home/widgets/widgets.dart';
import 'widgets/widgets.dart';

class ReadBarcodePage extends StatefulWidget {
  const ReadBarcodePage({Key? key}) : super(key: key);

  @override
  State<ReadBarcodePage> createState() => _ReadBarcodePageState();
}

class _ReadBarcodePageState extends State<ReadBarcodePage> {
  bool isStopped = false;
  late final QrReaderViewController controller;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return FutureBuilder(
      future: Permission.camera.request(),
      builder: (_, __) => Scaffold(
        body: Stack(
          children: [
            QrReaderView(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              callback: (controller) {
                this.controller = controller;
                controller.startCamera((p0, p1) async {
                  await controller.stopCamera();
                  isStopped = true;
                  setState(() {});
                });
              },
            ),
            Positioned(
              top: screenSize.height * .07,
              left: 0,
              right: 0,
              child: Text(
                isStopped ? 'CAUGHT!' : 'SHOW ME YOUR CODE',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            Positioned(
              bottom: screenSize.height * .4,
              top: screenSize.height * .4,
              left: screenSize.width * .2,
              right: screenSize.width * .2,
              child: const CodeBorderWidget(),
            ),
            if (isStopped)
              Positioned(
                left: 16,
                right: 16,
                bottom: 42,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircularIconButtonWidget.success(),
                    CircularIconButtonWidget.error(),
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}
