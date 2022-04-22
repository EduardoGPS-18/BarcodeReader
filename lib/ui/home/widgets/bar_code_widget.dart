import 'package:barcode_reader/domain/entities/entities.dart';
import 'package:flutter/material.dart';

class BarCodeWidget extends StatelessWidget {
  final VoidCallback? onTap;
  final void Function(CodeEntity code)? onDismissed;
  final CodeEntity code;

  const BarCodeWidget({
    Key? key,
    this.onTap,
    required this.code,
    this.onDismissed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.startToEnd,
      background: Container(
        color: Colors.red,
        child: Row(
          children: const [
            Padding(
              padding: EdgeInsets.only(left: 16),
              child: Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      key: GlobalKey(),
      onDismissed: (_) => onDismissed?.call(code),
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      code.title,
                      style: const TextStyle(
                        fontFamily: 'roboto',
                        fontWeight: FontWeight.w300,
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      code.code,
                      style: const TextStyle(
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: onTap,
                icon: const Icon(Icons.forward),
              )
            ],
          ),
        ),
        elevation: 8,
      ),
    );
  }
}
