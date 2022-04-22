import 'package:barcode_reader/main/factories/usecases/code/delete_code_usecase_factory.dart';
import 'package:barcode_reader/main/factories/usecases/code/fetch_code_usecase_factory.dart';
import 'package:barcode_reader/main/factories/usecases/code/save_code_usecase_factory.dart';
import 'package:barcode_reader/presentation/home/getx_home_presenter.dart';
import 'package:barcode_reader/ui/home/home_presenter.dart';

HomePresenter makeHomePresenter() {
  return GetxHomePresenter(
    fetchBarCodes: makeFetchBarCodes(),
    deleteBarCode: makeDeleteBarCode(),
    saveCodeUseCase: makeSaveCodeUseCase(),
  );
}
