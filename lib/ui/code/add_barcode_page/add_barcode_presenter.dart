import 'package:barcode_reader/presentation/helpers/presenter_navigation_manager.dart';

abstract class AddBarcodePresenter with PresenterNavigationManagerI {
  void navigateToReadCodePage();
}
