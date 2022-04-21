import 'package:flutter/material.dart';
import 'package:flutter_qr_reader/flutter_qr_reader.dart';
import 'package:permission_handler/permission_handler.dart';

import '../shared/shared.dart';
import 'widgets/code_border_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
