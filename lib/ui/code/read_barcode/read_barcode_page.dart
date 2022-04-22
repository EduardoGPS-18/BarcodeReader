import 'package:barcode_reader/presentation/helpers/navigation_arguments.dart';
import 'package:barcode_reader/ui/code/read_barcode/read_barcode_presenter.dart';
import 'package:barcode_reader/ui/helpers/ui_navigation_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qr_reader/flutter_qr_reader.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../home/widgets/widgets.dart';
import 'widgets/widgets.dart';

class ReadBarcodePage extends StatefulWidget {
  final ReadBarcodePresenter presenter;

  const ReadBarcodePage({
    Key? key,
    required this.presenter,
  }) : super(key: key);

  @override
  State<ReadBarcodePage> createState() => _ReadBarcodePageState();
}

class _ReadBarcodePageState extends State<ReadBarcodePage> with UINavigationManager {
  late final QrReaderViewController controller;

  @override
  Stream<NavigationArguments> get navigateToStream => widget.presenter.navigationStream;

  @override
  void initState() {
    super.initState();

    widget.presenter.scanningStream.listen((scanning) async {
      if (scanning) {
        configureCamToReadBarcode();
      } else {
        await controller.stopCamera();
      }
    });
  }

  void configureCamToReadBarcode() async {
    await controller.startCamera((barCodeValue, _) async {
      widget.presenter.qrcodeReaded(barCodeValue);
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return FutureBuilder(
      future: Permission.camera.request(),
      builder: (_, __) => Scaffold(
        body: StreamBuilder<bool>(
          stream: widget.presenter.scanningStream,
          builder: (context, keepScanningSnap) {
            final hasQrcodeReaded = keepScanningSnap.data == false;
            return Stack(
              children: [
                QrReaderView(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  callback: (controller) {
                    this.controller = controller;
                    configureCamToReadBarcode();
                  },
                ),
                Positioned(
                  top: screenSize.height * .07,
                  left: 0,
                  right: 0,
                  child: Text(
                    hasQrcodeReaded ? 'CAUGHT!' : 'SHOW ME YOUR BAR CODE',
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
                if (hasQrcodeReaded)
                  Positioned(
                    left: 16,
                    right: 16,
                    bottom: 42,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircularIconButtonWidget.success(onPressed: widget.presenter.useCurrentCode),
                        CircularIconButtonWidget.error(onPressed: widget.presenter.readAgain),
                      ],
                    ),
                  )
              ],
            );
          },
        ),
      ),
    );
  }
}
