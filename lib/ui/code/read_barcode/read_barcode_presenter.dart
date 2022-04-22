import 'package:barcode_reader/presentation/helpers/presenter_navigation_manager.dart';

abstract class ReadBarcodePresenter with PresenterNavigationManagerI {
  void readAgain();
  void qrcodeReaded(String value);
  void useCurrentCode();
  Stream<bool> get scanningStream;
}
