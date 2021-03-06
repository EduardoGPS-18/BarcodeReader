import 'package:barcode_reader/main/factories/usecases/code/save_code_usecase_factory.dart';
import 'package:barcode_reader/presentation/code/add_barcode/getx_add_barcode_presenter.dart';
import 'package:barcode_reader/ui/code/add_barcode_page/add_barcode_presenter.dart';

AddBarcodePresenter makeAddBarcodePresenter() {
  return GetxAddBarcodePresenter(
    saveCodeUseCase: makeSaveCodeUseCase(),
  );
}
