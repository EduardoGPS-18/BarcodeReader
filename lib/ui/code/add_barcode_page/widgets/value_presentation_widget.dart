import 'package:flutter/material.dart';

class ValuePresentation extends StatelessWidget {
  final TextEditingController? controller;
  final VoidCallback? onTap;

  const ValuePresentation({
    Key? key,
    this.controller,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: true,
      onTap: onTap,
      controller: controller,
      decoration: const InputDecoration(
        hintText: 'Barcode value',
      ),
    );
  }
}
