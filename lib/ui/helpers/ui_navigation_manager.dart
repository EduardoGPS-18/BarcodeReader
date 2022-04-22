import 'package:barcode_reader/presentation/helpers/navigation_arguments.dart';
import 'package:flutter/material.dart';

mixin UINavigationManager<T extends StatefulWidget> on State<T> {
  Stream<NavigationArguments> get navigateToStream;

  @override
  void initState() {
    super.initState();
    navigateToStream.listen((navArgs) {
      if (navArgs is NavigateBack) {
        Navigator.of(context).pop(navArgs.result);
      }
      if (navArgs is NavigateForward) {
        Navigator.of(context).pushNamed(navArgs.route);
      }
      if (navArgs is NavigateReplace) {
        Navigator.of(context).pushReplacementNamed(navArgs.route);
      }
      if (navArgs is NavigateAndClearStack) {
        Navigator.of(context).pushNamedAndRemoveUntil(navArgs.route, (route) => false);
      }
    });
  }
}
