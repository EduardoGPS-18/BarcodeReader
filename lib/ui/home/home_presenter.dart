import 'package:barcode_reader/domain/entities/entities.dart';
import 'package:barcode_reader/presentation/helpers/helpers.dart';

abstract class HomePresenter with PresenterNavigationManagerI {
  Stream<List<CodeEntity>> get barcodesStream;

  void navigateToAddCodePage();
}
