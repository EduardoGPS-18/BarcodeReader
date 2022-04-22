import 'package:barcode_reader/domain/usecases/code/save_code.dart';
import 'package:barcode_reader/main/settings/app_routes.dart';
import 'package:barcode_reader/presentation/helpers/navigation_arguments.dart';
import 'package:barcode_reader/presentation/helpers/presenter_navigation_manager.dart';
import 'package:barcode_reader/ui/code/add_barcode_page/add_barcode_presenter.dart';
import 'package:get/get.dart';

class GetxAddBarcodePresenter extends GetxController with PresenterNavigationManager implements AddBarcodePresenter {
  final SaveCodeUseCase saveCodeUseCase;

  GetxAddBarcodePresenter({
    required this.saveCodeUseCase,
  });

  final _isValidForm = Rx<bool>(false);
  @override
  Stream<bool> get isValidFormStream => _isValidForm.stream;

  var _barcodeTitle = "";
  var _barcodeValue = "";

  @override
  set barCodeValue(String barCodeValue) {
    _barcodeValue = barCodeValue;
    validateForm();
  }

  @override
  void validateTitle(String title) {
    _barcodeTitle = title;
    validateForm();
  }

  void validateForm() {
    if (_barcodeTitle.length > 3 && _barcodeValue.isNotEmpty) {
      _isValidForm.subject.add(true);
    } else {
      _isValidForm.subject.add(false);
    }
  }

  @override
  void saveBarcode() async {
    final saveCodeParams = SaveCodeParams(title: _barcodeTitle, code: _barcodeValue);
    final codeEntity = await saveCodeUseCase.call(param: saveCodeParams);
    navigateToWithArguments = NavigateBack(result: codeEntity);
  }

  @override
  void navigateToReadCodePage() {
    navigateToWithArguments = NavigateForward(route: AppRoutes.barCodeCamPage);
  }
}
