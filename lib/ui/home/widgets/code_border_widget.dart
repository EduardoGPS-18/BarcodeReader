import 'package:flutter/material.dart';

class CodeBorderWidget extends StatelessWidget {
  const CodeBorderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border.symmetric(
          vertical: BorderSide(
            color: Colors.red,
          ),
          horizontal: BorderSide(
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
