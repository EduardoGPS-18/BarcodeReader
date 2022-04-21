import 'package:flutter/material.dart';

class CircularIconButtonWidget extends StatelessWidget {
  final double radius;
  final double iconSize;

  final Color backgroundColor;
  final Color iconColor;

  final VoidCallback? onPressed;

  final IconData icon;

  const CircularIconButtonWidget({
    Key? key,
    required this.radius,
    required this.iconSize,
    required this.backgroundColor,
    required this.iconColor,
    required this.icon,
    this.onPressed,
  }) : super(key: key);

  factory CircularIconButtonWidget.success({double? radius, double? iconSize, VoidCallback? onPressed}) {
    return CircularIconButtonWidget(
      icon: Icons.check,
      radius: radius ?? 24,
      iconSize: iconSize ?? 32,
      backgroundColor: Colors.green,
      iconColor: Colors.white,
      onPressed: onPressed,
    );
  }
  factory CircularIconButtonWidget.error({double? radius, double? iconSize, VoidCallback? onPressed}) {
    return CircularIconButtonWidget(
      icon: Icons.close,
      radius: radius ?? 24,
      iconSize: iconSize ?? 32,
      backgroundColor: Colors.red,
      iconColor: Colors.white,
      onPressed: onPressed,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: radius * 2,
      width: radius * 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
      ),
      child: IconButton(
        icon: Icon(
          icon,
          size: iconSize,
          color: Colors.white,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
