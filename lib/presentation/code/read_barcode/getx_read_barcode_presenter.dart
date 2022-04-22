import 'package:barcode_reader/presentation/helpers/navigation_arguments.dart';
import 'package:barcode_reader/presentation/helpers/presenter_navigation_manager.dart';
import 'package:barcode_reader/ui/code/read_barcode/read_barcode_presenter.dart';
import 'package:get/get.dart';

class GetxReadBarcodePresenter extends GetxController with PresenterNavigationManager implements ReadBarcodePresenter {
  final _keepScanning = Rx<bool>(true);
  @override
  Stream<bool> get scanningStream => _keepScanning.stream;

  String _currentCode = "";

  @override
  void qrcodeReaded(String value) {
    _currentCode = value;
    _keepScanning.subject.add(value.isEmpty);
  }

  @override
  void readAgain() {
    _keepScanning.subject.add(true);
  }

  @override
  void useCurrentCode() {
    navigateToWithArguments = NavigateBack(result: _currentCode);
  }
}
