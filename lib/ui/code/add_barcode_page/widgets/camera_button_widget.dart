import 'package:flutter/material.dart';

class CameraButtonWidget extends StatelessWidget {
  const CameraButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: const Icon(
        Icons.camera_alt_outlined,
        size: 32,
      ),
    );
  }
}
