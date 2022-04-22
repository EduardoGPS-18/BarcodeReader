import 'package:barcode_reader/presentation/helpers/navigation_arguments.dart';
import 'package:barcode_reader/ui/code/add_barcode_page/add_barcode_presenter.dart';
import 'package:barcode_reader/ui/helpers/ui_navigation_manager.dart';
import 'package:flutter/material.dart';

import 'widgets/widgets.dart';

class AddBarcodePage extends StatefulWidget {
  final AddBarcodePresenter presenter;

  const AddBarcodePage({
    Key? key,
    required this.presenter,
  }) : super(key: key);

  @override
  State<AddBarcodePage> createState() => _CodeAddPageState();
}

class _CodeAddPageState extends State<AddBarcodePage> with UINavigationManager {
  final textEditingController = TextEditingController();
  @override
  Stream<NavigationArguments> get navigateToStream => widget.presenter.navigationStream;

  @override
  void onReciveDataFromNextPage(data) {
    if (data is String) {
      widget.presenter.barCodeValue = data;
      textEditingController.text = data;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('ADD BAR CODE'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: widget.presenter.validateTitle,
              decoration: const InputDecoration(
                hintText: "Video link",
                labelText: "Barcode title",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                CameraButtonWidget(
                  onTap: widget.presenter.navigateToReadCodePage,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ValuePresentation(
                    controller: textEditingController,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                StreamBuilder<bool>(
                  stream: widget.presenter.isValidFormStream,
                  builder: (context, isValidSnap) {
                    return ElevatedButton(
                      onPressed: isValidSnap.data == true ? widget.presenter.saveBarcode : null,
                      child: const Text('Save'),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
