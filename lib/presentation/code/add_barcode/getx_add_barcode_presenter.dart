import 'package:barcode_reader/main/settings/app_routes.dart';
import 'package:barcode_reader/presentation/helpers/navigation_arguments.dart';
import 'package:barcode_reader/presentation/helpers/presenter_navigation_manager.dart';
import 'package:barcode_reader/ui/code/add_barcode_page/add_barcode_presenter.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class GetxAddBarcodePresenter extends GetxController with PresenterNavigationManager implements AddBarcodePresenter {
  @override
  void navigateToReadCodePage() {
    navigateToWithArguments = NavigateForward(route: AppRoutes.barCodeCamPage);
  }
}
