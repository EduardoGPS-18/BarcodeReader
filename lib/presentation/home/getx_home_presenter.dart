import 'package:barcode_reader/domain/entities/code/code_entity.dart';
import 'package:barcode_reader/presentation/helpers/navigation_arguments.dart';
import 'package:barcode_reader/presentation/helpers/presenter_navigation_manager.dart';
import 'package:barcode_reader/ui/home/home_presenter.dart';
import 'package:get/get.dart';

class GetxHomePresenter extends GetxController with PresenterNavigationManager implements HomePresenter {
  final Rx<List<CodeEntity>> _barcodesController = Rx<List<CodeEntity>>([]);
  @override
  Stream<List<CodeEntity>> get barcodesStream => _barcodesController.stream;

  @override
  void navigateToAddCodePage() {
    navigateToWithArguments = NavigateForward(route: '');
  }
}
