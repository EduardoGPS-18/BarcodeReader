import 'package:barcode_reader/domain/entities/code/code_entity.dart';
import 'package:barcode_reader/domain/usecases/code/delete_code.dart';
import 'package:barcode_reader/domain/usecases/code/fetch_code.dart';
import 'package:barcode_reader/domain/usecases/code/save_code.dart';
import 'package:barcode_reader/main/settings/app_routes.dart';
import 'package:barcode_reader/presentation/helpers/navigation_arguments.dart';
import 'package:barcode_reader/presentation/helpers/presenter_navigation_manager.dart';
import 'package:barcode_reader/ui/home/home_presenter.dart';
import 'package:get/get.dart';

class GetxHomePresenter extends GetxController with PresenterNavigationManager implements HomePresenter {
  final FetchBarCodes fetchBarCodes;
  final DeleteBarCode deleteBarCode;
  final SaveCodeUseCase saveCodeUseCase;

  GetxHomePresenter({
    required this.fetchBarCodes,
    required this.deleteBarCode,
    required this.saveCodeUseCase,
  });

  final _undoDelete = Rx<CodeEntity?>(null);
  @override
  Stream<CodeEntity?> get undoDelete => _undoDelete.stream;

  final Rx<List<CodeEntity>> _barcodesController = Rx<List<CodeEntity>>([]);
  @override
  Stream<List<CodeEntity>> get barcodesStream => _barcodesController.stream;

  @override
  void navigateToAddCodePage() {
    navigateToWithArguments = NavigateForward(route: AppRoutes.addBarCodePage);
  }

  @override
  void addCode(CodeEntity code) {
    _barcodesController.value = [..._barcodesController.value, code];
  }

  @override
  Future<void> loadCodes() async {
    final codes = await fetchBarCodes.call();
    _barcodesController.value = codes;
  }

  @override
  Future<void> deleteCode(CodeEntity code) async {
    await deleteBarCode.call(param: DeleteBarCodeParams(barCodeId: code.id));
    _undoDelete.subject.add(code);
    _barcodesController.value = [..._barcodesController.value.where((currCode) => currCode.id != code.id)];
  }

  @override
  Future<void> reInsertCode(CodeEntity code) async {
    await saveCodeUseCase.call(param: SaveCodeParams(title: code.title, code: code.code));
    _barcodesController.value = [..._barcodesController.value, code];
  }
}
