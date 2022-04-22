import 'package:flutter/material.dart';

import 'widgets/widgets.dart';

class CodeAddPage extends StatefulWidget {
  const CodeAddPage({Key? key}) : super(key: key);

  @override
  State<CodeAddPage> createState() => _CodeAddPageState();
}

class _CodeAddPageState extends State<CodeAddPage> {
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
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Video link",
                labelText: "Barcode title",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: const [
                CameraButtonWidget(),
                SizedBox(width: 12),
                Expanded(
                  child: ValuePresentation(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}