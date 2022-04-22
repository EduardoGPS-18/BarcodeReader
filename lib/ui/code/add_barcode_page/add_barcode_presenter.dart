import 'package:barcode_reader/presentation/helpers/presenter_navigation_manager.dart';

abstract class AddBarcodePresenter with PresenterNavigationManagerI {
  Stream<bool> get isValidFormStream;

  void saveBarcode();
  void validateTitle(String title);
  void navigateToReadCodePage();

  set barCodeValue(String barCodeValue);
}
