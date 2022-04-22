import 'package:flutter/material.dart';

class CameraButtonWidget extends StatelessWidget {
  final VoidCallback? onTap;

  const CameraButtonWidget({
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: const Icon(
        Icons.camera_alt_outlined,
        size: 32,
      ),
    );
  }
}
