import 'package:barcode_reader/domain/entities/entities.dart';
import 'package:barcode_reader/presentation/helpers/helpers.dart';

abstract class HomePresenter with PresenterNavigationManagerI {
  Stream<List<CodeEntity>> get barcodesStream;
  Stream<CodeEntity?> get undoDelete;

  void navigateToAddCodePage();

  void addCode(CodeEntity code);

  Future<void> loadCodes();
  Future<void> deleteCode(CodeEntity code);
  Future<void> reInsertCode(CodeEntity code);
}
