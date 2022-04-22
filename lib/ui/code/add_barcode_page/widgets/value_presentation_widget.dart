import 'package:flutter/material.dart';

class ValuePresentation extends StatelessWidget {
  const ValuePresentation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TextField(
      readOnly: true,
      decoration: InputDecoration(
        hintText: 'Barcode value',
      ),
    );
  }
}
