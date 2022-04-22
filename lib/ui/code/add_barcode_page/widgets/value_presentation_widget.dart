import 'package:flutter/material.dart';

class ValuePresentation extends StatelessWidget {
  final TextEditingController? controller;

  const ValuePresentation({
    Key? key,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: true,
      controller: controller,
      decoration: const InputDecoration(
        hintText: 'Barcode value',
      ),
    );
  }
}
