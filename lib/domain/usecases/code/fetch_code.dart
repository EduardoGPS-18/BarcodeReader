import '../../entities/code/code.dart';
import '../core/core.dart';

abstract class FetchBarCode implements WithoutInUseCase<Future<List<CodeEntity>>> {}
