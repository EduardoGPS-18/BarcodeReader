import 'package:barcode_reader/presentation/helpers/navigation_arguments.dart';
import 'package:flutter/material.dart';

mixin UINavigationManager<T extends StatefulWidget> on State<T> {
  Stream<NavigationArguments> get navigateToStream;

  void onReciveDataFromNextPage(dynamic data) {
    debugPrint("You recive this implement $this method on page!");
  }

  @override
  void initState() {
    super.initState();
    navigateToStream.listen((navArgs) async {
      if (navArgs is NavigateBack) {
        Navigator.of(context).pop(navArgs.result);
        return;
      }
      dynamic result;
      if (navArgs is NavigateForward) {
        result = await Navigator.of(context).pushNamed(navArgs.route);
      }
      if (navArgs is NavigateReplace) {
        result = await Navigator.of(context).pushReplacementNamed(navArgs.route);
      }
      if (navArgs is NavigateAndClearStack) {
        result = await Navigator.of(context).pushNamedAndRemoveUntil(navArgs.route, (route) => false);
      }
      onReciveDataFromNextPage(result);
    });
  }
}
